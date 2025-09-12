clc,clear
global Vci Abi At gama c_ast D d L roup a n

%原始数据
Dci = 96*1e-3;       %燃烧室筒段内径
Lci = 340*1e-3;      %筒段装药可占用长度
dt = 17.7*1e-3;      %喉管喉径
D = 93*1e-3;         %药柱外径
d = 14*1e-3;         %药柱内径
L = 330*1e-3;        %药柱长度
Ti = 293.15;         %初温
roup = 1.6*1e3;      %推进剂密度
k = 1.252;           %比热比
Tf = 2193.2;         %定压燃烧温度
m_ = 23.4;           %燃气平均分子量
pig = 2e6;           %助推器点火压强

%常量计算

%燃烧室初始自由容积
Vci = (pi*Dci^2/4)*Lci - pi*(D^2 - d^2)/4*L;
%装药初始燃烧面积
Abi = pi*(D + d)*L + 2*pi*(D^2 -d^2)/4;
%装药总燃烧肉厚
E = (D - d)/4;
%喷喉面积
At = pi*dt^2/4;
%Γ值
gama = k^0.5*(2/(k + 1))^((k + 1)/2/(k - 1));
%特征速度
c_ast = ((8.314e3/m_)*Tf)^0.5/gama;
%燃速
%r = 0.5125*(1.02e-5*pc)^0.66*1e-3;
a = 0.5125*1.02e-5^0.66*1e-3;
n = 0.66;

%RK4积分求解

    %初值
    e0 = 0;
    pc0 = pig;

    %压强上升段&稳定工作段
    espan = [e0,E];
    [e,pc] = ode45(@(e,pc) odefun(e,pc), espan, pc0);
    pc = pc';
    %转换至时间坐标
    r = a.*pc.^n;
    i = 1;
    t_stage2(1) = 0;
    while i < length(e)
       i = i + 1;
       deltat = (e(i) - e(i - 1))/r(i - 1);
       t_stage2(i) = t_stage2(i - 1) + deltat;
    end

    %后效段
    deltapc3 = -1e5;
    i = 0;
    t3 = 0;
    pc_equ = pc(end);
    pc3 = pc(end);
    while pc3 > 1e5
        i = i + 1;
        t_stage3(i) = Vc(E)/(gama^2*c_ast*At)*log(pc_equ/pc3);
        pc_stage3(i) = pc3;
        pc3 = pc3 + deltapc3;
    end
    t_stage3 = t_stage3 + t_stage2(end);

%数据汇总&绘图
pc_result = [pc,pc_stage3].*1e-6;
t_result = [t_stage2,t_stage3].*1e3;
plot(t_result,pc_result,'LineWidth',4);
xlim([0,1.05*t_result(end)]);
ylim([0,1.1*max(pc_result)]);
xlabel('燃烧时间(t / ms)','FontSize',16);
ylabel('燃烧室室压(p_{c} / MPa)','FontSize',16);

pcmax = max(pc_result);
label = sprintf('p_{c,max} = %.1fMPa',pcmax);
y = yline(pcmax,'--k',{'室压最大值',label},'fontsize',16,'LineWidth',1.5);
y.LabelHorizontalAlignment = 'left';

t_pcmax = t_result(find(pc_result == max(pc_result)));
label = sprintf('t_{pc,max} = %.1fms',t_pcmax);
x = xline(t_pcmax,'--k',{'室压最大值对应时间',label},'fontsize',16,'LineWidth',1.5);
x.LabelVerticalAlignment = 'bottom';
x.LabelOrientation = 'horizontal';

label = sprintf('p_{c,stage-end} = %.1fMPa',1e-6*pc(end));
y1 = yline(1e-6*pc(end),'--k',{'稳定工作段结束时室压',label},'fontsize',16,'LineWidth',1.5);

label = sprintf('t_{pc,stage-end} = %.1fms',1e3*t_stage2(end));
x1 = xline(1e3*t_stage2(end),'--k',{'稳定工作段结束时间',label},'fontsize',16,'LineWidth',1.5);
x1.LabelVerticalAlignment = 'bottom';
x1.LabelOrientation = 'horizontal';
x1.LabelHorizontalAlignment = 'left';

label = sprintf('t_{pc,end} = %.1fms',t_result(end));
x2 = xline(t_result(end),'--k',{'仿真结束时间',label},'fontsize',16,'LineWidth',1.5);
x2.LabelVerticalAlignment = 'bottom';

title('例5-2 燃烧室室压计算结果','FontSize',16);
grid on;

%函数定义

%装药燃烧面积
function result = Ab(e)
    global Abi D d
    result = Abi - 4*pi*(D + d)*e;
end

%燃烧室自由容积
function result = Vc(e)
    global Vci D d L
    result = Vci + pi*e*(D + d)*((L - 2*e) + 0.5*(D - d));
end

%微分方程
function ODE = odefun(e,pc)
    global c_ast At gama roup a n
    ODE = (c_ast*roup*Ab(e)*a/At - pc^(1 - n))/(Vc(e)*a/(gama^2*c_ast*At));
end
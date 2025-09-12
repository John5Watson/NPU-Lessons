clc,clear

%初始条件
g = 9.8;            %重力加速度
m0 = 300;           %导弹质量
Jz = 350;           %转动惯量
P = 2000;           %发动机推力
ms = 0.46;          %质量秒消耗量
x0 = 0;             %初始位置
H0 = 7000;          %初始高度
theta0 = 0;         %初始弹道倾角           
phi0 = 0;           %初始俯仰角
alpha0 = 0;         %初始攻角
phi0_v = 0;         %初始俯仰角速度
V0 = 300;           %初始速度
Sref = 0.45;        %参考面积
Lref = 2.5;         %参考长度
mz_omegaz = -2;     %阻尼力矩系数
rou0 = 1.2495;      %海平面大气密度
T0 = 288.15;        %海平面大气温度
kphi = -1;          %舵偏角比例系数
kphi_v = -50;       %舵偏角速度比例系
kH = -1;            %高度比例系数
kH_v = -100;        %高度速度比例系数
deltazlim = 15;     %舵偏角限制
k = 2;              %比例导引法比例系数
ktheta = -9;        %弹道倾角比例系数
ktheta_v = 5;       %弹道倾角速度比例系数

% 基本公式
% Cy = 0.25*alpha + 0.05*deltaz;     升力系数
% Cx = 0.2 + 0.005*alpha^2;           阻力系数
% mz = -0.1*alpha + 0.024*deltaz;    俯仰力矩系数
% Y = Cy*q*Sref;                      升力
% X = Cx*q*Sref;                      阻力
% Mz = mz*q*Sref*Lref;               俯仰力矩
% q = 0.5*rou*V^2;                   动压
% T = T0 - 0.0065*H;                  大气温度
% rou = rou0*(T/T0)^4.25588;          大气密度

%弹道计算
dt = 0.01;        %迭代步长

    %迭代   

    %循环（一阶段）
    m = m0;
    x = x0;
    H = H0;
    y = H;
    theta = theta0;
    phi = phi0;
    alpha = alpha0;
    phi_v = phi0_v;
    omegaz = phi_v;
    domegaz = 0;
    V = V0;
    rou = rou0;
    T = T0;
    t = 0;
    H_old = H;
    H_ast_old = 2000*cos(0.000314*1.1*x) + 5000;
    phi_old = phi;
    phi_v_old = phi_v;
    i = 0;

    while x < 9100
        t = t + dt;
        i = i+1;

        %高度计算
        H_ast = 2000*cos(0.000314*1.1*x) + 5000;
        H = y;
        H_v = H - H_old;
        H_ast_v = H_ast - H_ast_old;

        %动压计算
        T = T0 - 0.0065*H;
        rou = rou0*(T/T0)^4.25588;
        q = 0.5*rou*V^2;
        
        %舵偏角&攻角计算
        deltaz = kH*(H-H_ast) + kH_v*(H_v-H_ast_v) + kphi*(phi) + kphi_v*(phi_v);
        if(abs(deltaz) > deltazlim)
           deltaz = deltaz/abs(deltaz)*deltazlim;
        end
        alpha = (phi - theta)*180/pi;
    
        %力计算
        Cy = 0.25*alpha + 0.05*deltaz;
        Cx = 0.2 + 0.005*alpha^2;
        Y = Cy*q*Sref;
        X = Cx*q*Sref;

        %力矩计算
        omegaz_ = omegaz*Lref/V;
        mz = -0.1*alpha + 0.024*deltaz + mz_omegaz*omegaz_;
        Mz = mz*q*Sref*Lref;
    
        %运动状态参数
        dV = (-X/m - g*sin(theta))*dt;
        dtheta = (Y/m/V - g*cos(theta)/V)*dt;
        domegaz = Mz/Jz*dt;
        dx = V*cos(theta)*dt;
        dy = V*sin(theta)*dt;
        dphi = omegaz*dt; 

        V = V + dV;
        theta = theta + dtheta;
        phi_v_old = omegaz;
        omegaz = omegaz + domegaz;
        phi_v = omegaz;
        phi_old = phi;
        phi = phi + dphi;
        H_ast_old = 2000*cos(0.000314*1.1*x) + 5000;
        x = x + dx;
        H_old = y;
        y = y + dy;

        %数据存储
        t_save(i) = t;
        x_save(i) = x;
        H_save(i) = y;
        H_ast_save(i) = H_ast;
        V_save(i) = V;
        alpha_save(i) = alpha;
        theta_save(i) = theta*180/pi;
        deltaz_save(i) = deltaz;
        phi_save(i) = phi;
        t_stage1 = t;
        x_stage1 = x;
        %动态特性参数存储
        Mz_save(i) = Mz;
        m_save(i) = m;
        q_save(i) = q;
        P_save(i) = 0;
        X_save(i) = X;
        Y_save(i) = Y;

    end

    %循环（二阶段）
    while x > 9100 && x < 24000
        t = t + dt;
        i = i+1;

        %高度计算
        H_ast = 3050;
        H = y;
        H_v = H - H_old;

        %动压计算
        T = T0 - 0.0065*H;
        rou = rou0*(T/T0)^4.25588;
        q = 0.5*rou*V^2;
        
        %舵偏角&攻角计算
        deltaz = kH*(H-H_ast) + kH_v*(H_v) + kphi*(phi) + kphi_v*(phi_v);
        if(abs(deltaz) > deltazlim)
           deltaz = deltaz/abs(deltaz)*deltazlim;
        end
        alpha = (phi - theta)*180/pi;
    
        %力计算
        Cy = 0.25*alpha + 0.05*deltaz;
        Cx = 0.2 + 0.005*alpha^2;
        Y = Cy*q*Sref;
        X = Cx*q*Sref;

        %力矩计算
        omegaz_ = omegaz*Lref/V;
        mz = -0.1*alpha + 0.024*deltaz + mz_omegaz*omegaz_;
        Mz = mz*q*Sref*Lref;
    
        %运动状态参数
        dV = (P*cosd(alpha)/m - X/m - g*sin(theta))*dt;
        dtheta = (P*sind(alpha)/m/V + Y/m/V - g*cos(theta)/V)*dt;
        domegaz = Mz/Jz*dt;
        dx = V*cos(theta)*dt;
        dy = V*sin(theta)*dt;
        dphi = omegaz*dt;
        dm = -ms*dt;

        V = V + dV;
        theta = theta + dtheta;
        phi_v_old = omegaz;
        omegaz = omegaz + domegaz;
        phi_v = omegaz;
        phi_old = phi;
        phi = phi + dphi;
        x = x + dx;
        H_old = y;
        y = y + dy;
        m = m + dm;

        %数据存储
        t_save(i) = t;
        x_save(i) = x;
        H_save(i) = y;
        H_ast_save(i) = H_ast;
        V_save(i) = V;
        alpha_save(i) = alpha;
        theta_save(i) = theta*180/pi;
        deltaz_save(i) = deltaz;
        phi_save(i) = phi;
        t_stage2 = t;
        x_stage2 = x;
        %动态特性参数存储
        Mz_save(i) = Mz;
        m_save(i) = m;
        q_save(i) = q;
        P_save(i) = 2000;
        X_save(i) = X;
        Y_save(i) = Y;

    end

    %循环（三阶段）
    x_target = 30000;
    y_target = 0;
    VT = 0;
    etaT = 0;
    que0 = atan((y_target - y)/(x_target - x));
    que = que0;
    theta_old = theta; 
    theta_ast = theta;
    err = 0;

    while x > 24000 && y > 0
        t = t + dt; 
        i = i+1;

        %导引法计算
        r = ((x - x_target)^2 + (y - y_target)^2)^0.5;
        que = atan((y_target - y)/(x_target - x));
        eta = que - theta;
        dque = (V*sin(eta)-VT*sin(etaT))/r*dt;
        dtheta_ast = k*dque;
        theta_ast_old = theta_ast;
        theta_ast = theta_ast + dtheta_ast;

        %舵偏角&攻角计算
        theta_v = theta - theta_old;
        theta_ast_v = theta_ast - theta_ast_old;
        deltaz = ktheta*(theta - theta_ast) + ktheta_v*(theta_v - theta_ast_v);
        if(abs(deltaz) > deltazlim)
           deltaz = deltaz/abs(deltaz)*deltazlim;
        end
        alpha = (phi - theta)*180/pi;
        
        %动压计算
        T = T0 - 0.0065*H;
        rou = rou0*(T/T0)^4.25588;
        q = 0.5*rou*V^2;
    
        %力计算
        Cy = 0.25*alpha + 0.05*deltaz;
        Cx = 0.2 + 0.005*alpha^2;
        Y = Cy*q*Sref;
        X = Cx*q*Sref;

        %力矩计算
        omegaz_ = omegaz*Lref/V;
        mz = -0.1*alpha + 0.024*deltaz + mz_omegaz*omegaz_;
        Mz = mz*q*Sref*Lref;
    
        %运动状态参数
        dV = (-X/m - g*sin(theta))*dt;
        dtheta = (Y/m/V - g*cos(theta)/V)*dt;
        domegaz = Mz/Jz*dt;
        dx = V*cos(theta)*dt;
        dy = V*sin(theta)*dt;
        dphi = omegaz*dt; 

        V = V + dV;
        theta_old = theta;
        theta = theta + dtheta;
        omegaz = omegaz + domegaz;
        phi = phi + dphi;
        x = x + dx;
        y = y + dy;

        %数据存储
        t_save(i) = t;
        x_save(i) = x;
        H_save(i) = y;
        H_ast_save(i) = 0;
        V_save(i) = V;
        alpha_save(i) = alpha;
        theta_save(i) = theta*180/pi;
        deltaz_save(i) = deltaz;
        que_save(i) = que*180/pi;
        phi_save(i) = phi;
        theta_ast_save(i) = theta_ast*180/pi;
        t_stage3 = t;
        x_stage3 = x;
        %动态特性参数存储
        Mz_save(i) = Mz;
        m_save(i) = m;
        q_save(i) = q;
        P_save(i) = 0;
        X_save(i) = X;
        Y_save(i) = Y;
        
    end

    %绘图

    %高度-水平位移
    subplot(2,3,1);
    plot(x_save,H_save,'LineWidth',1);
    hold on;
    plot(x_save,H_ast_save,'LineWidth',0.75);
    hold off;

    ylim([0,H0]);
    xlim([0,1.15*x_target]);

    label = sprintf('x=%.1fm',x_stage1);
    x1 = xline(x_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('x=%.1fm',x_stage2);
    x2 = xline(x_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    
    x_attack = x + (x_save(i-1) - x)/(H_save(i-1)-H_save(i))*(y_target-H_save(i));
    e = abs(x_attack - x_target);
    label = sprintf('e=%.1fm',e);
    x3 = xline(x_attack,'--r',{'打击误差',label});
    x3.LabelVerticalAlignment = 'bottom';

    xlabel('\fontsize{16}x/m');
    ylabel('\fontsize{16}H/m');
    legend('实际高度','期望高度','fontsize',12);
    title('\fontsize{16}弹道剖面（实际值与期望值比较）');
    grid on;

    %高度-时间
    subplot(2,3,2);
    plot(t_save,H_save,'LineWidth',1);
    hold on;
    plot(t_save,H_ast_save,'LineWidth',0.75);
    hold off;

    ylim([0,H0]);
    xlim([0,t_stage3]);
    
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';

    xlabel('\fontsize{16}x/m');
    ylabel('\fontsize{16}H/m');
    legend('实际高度','期望高度','fontsize',12);
    xlabel('\fontsize{16}t/s');
    ylabel('\fontsize{16}H/m');
    title('\fontsize{16}高度-时间曲线（实际值与期望值比较）');
    grid on;

    %速度-时间
    subplot(2,3,3);
    plot(t_save,V_save,'LineWidth',1);

    xlim([0,t_stage3]);

    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';

    xlabel('\fontsize{16}t/s');
    ylabel('\fontsize{16}V/(m/s)');
    title('\fontsize{16}速度-时间曲线');
    grid on;

    %舵偏角-时间
    subplot(2,3,4);
    plot(t_save,deltaz_save,'LineWidth',1);

    ylim([1.1*min(deltaz_save),1.1*max(deltaz_save)]);
    xlim([0,t_stage3]);

    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';

    xlabel('\fontsize{16}t/s');
    ylabel('\fontsize{16}δz/°');
    title('\fontsize{16}舵偏角-时间曲线');
    grid on;

    %攻角-时间
    subplot(2,3,5);
    plot(t_save,alpha_save,'LineWidth',1);

    ylim([1.1*min(alpha_save),1.1*max(alpha_save)]);
    xlim([0,t_stage3]);

    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';

    xlabel('\fontsize{16}t/s');
    ylabel('\fontsize{16}α/°');
    title('\fontsize{16}攻角-时间曲线');
    grid on;

    %弹道倾角(&视角)-时间
    subplot(2,3,6);
    plot(t_save,theta_save,'LineWidth',1);
    hold on;
    plot(t_save,theta_ast_save,'LineWidth',0.75);
    hold off;
    hold on;
    plot(t_save,que_save,'LineWidth',1);
    hold off;

    ylim([1.1*min(min(min(que_save),min(theta_save)),min(theta_ast_save)), ...
        1.1*max(max(max(que_save),max(theta_save)),max(theta_ast_save))]);
    xlim([0,t_stage3]);

    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    xlabel('\fontsize{16}x/m');
    ylabel('\fontsize{16}H/m');
    legend('实际弹道倾角','期望弹道倾角','视角','fontsize',8);

    xlabel('\fontsize{16}t/s');
    ylabel('\fontsize{16}θ(q)/°');
    title('\fontsize{16}弹道倾角(&视角)-时间曲线（实际值与期望值比较）');
    grid on;


%动态特性分析

%相关参数计算
%力导数 
X2alpha = q_save.*Sref.*(0.01.*alpha_save)./(180*pi);
X2v = 2.*(X_save./V_save);
Y2alpha = q_save.*Sref.*(0.25/pi*180);
Y2deltaz = q_save.*Sref.*(0.05/pi*180);
Y2v = 2.*(Y_save./V_save);
%力矩导数
Mz2v = 2.*Mz_save./V_save;
Mz2alpha = q_save.*(Sref*Lref).*(-0.1/pi*180);
Mz2deltaz = q_save.*(Sref*Lref).*(0.024/pi*180);
Mz2omegaz = mz_omegaz.*(q_save./V_save).*(Sref*Lref^2);

%动力系数计算
a22 = -Mz2omegaz./Jz;
a24 = -Mz2alpha./Jz;
a25 = -Mz2deltaz./Jz;
a21 = -Mz2v./Jz;
a_24 = 0;

a34 = (P_save + Y2alpha)./(m_save.*V_save);
a35 = Y2deltaz./(m_save.*V_save);
a33 = -(g.*sind(theta_save)./V_save);
a31 = -Y2v./(m_save.*V_save);

a14 = (P_save.*(alpha_save/180*pi) + X2alpha)./m_save;
a13 = g.*cosd(theta_save);
a11 = -(-X2v)./m_save;

%短周期传递函数参数计算
Ka = (a25.*a34 - a24.*a35)./(a24 + a22.*a34);
Ta = 1./(sqrt(a24 + a22.*a34));
ksia = (a22 + a34 + a_24)./(2.*sqrt(a24 + a22.*a34));
T1a = (a25 - a_24.*a35)./(a25.*a34 - a24.*a35);

%特征方程系数计算
A0 = 1;
A1 = a22 + a33 + a11 + a34 + a_24;
A2 = a22.*a34 + a24 + a22.*a33 + a34.*a11 + a_24.*a11 + a_24.*a33 + a11.*(a22 + a33) - a31.*(a13 - a14);
A3 = a24.*a33 + a24.*a11 - a21.*a14 + a22.*a34.*a11 - a22.*a31.*(a13 - a14) + a22.*a33.*a11 - a_24.*a31.*a13 + a33.*a_24.*a11;
A4 = a24.*a33.*a11 - a21.*a34.*a13 - a21.*a33.*a14 - a24.*a31.*a13;
%短周期系数
A1_short = a22 + a34 + a_24 + a33;
A2_short = a24 + a22.*(a34 + a33) + a_24*a33;
A3_short = a24.*a33;

%稳定性判断
cont = 0;
while cont < i
    cont = cont + 1;
    S = [A0 A1(cont) A2(cont) A3(cont) A4(cont)];
    R = roots(S);

    if(real(R(1)) > 0 || real(R(2)) > 0 || real(R(3)) > 0 || real(R(4)) > 0)
        Key(cont) = -1;
        T_S1(cont) = 0;
        T_S2(cont) = 0;
        delta_S1(cont) = 0;
        delta_S2(cont) = 0;
    else 
        if(real(R(1))*real(R(2))*real(R(3))*real(R(4)) == 0)
            Key(cont) = 0;
            T_S1(cont) = abs(2*pi/imag(R(1)));
            T_S2(cont) = abs(2*pi/imag(R(3)));
            delta_S1(cont) = abs(log(1/2)/real(R(1)));
            delta_S2(cont) = abs(log(1/2)/real(R(3)));

            if(T_S2(cont) > 1e3)
                T_S2(cont) = 0;
            end
    else
        Key(cont) = 1;
        T_S1(cont) = abs(2*pi/imag(R(1)));
        T_S2(cont) = abs(2*pi/imag(R(3)));
        delta_S1(cont) = abs(log(1/2)/real(R(1)));
        delta_S2(cont) = abs(log(1/2)/real(R(3)));

        if(T_S2(cont) > 1e3)
                T_S2(cont) = 0;
        end

        end
    end

    S_short = [A0 A1_short(cont) A2_short(cont) A3_short(cont)];
    R = roots(S_short);

    if(abs(real(R(3))) < 1e-3)
        R(3) = 0;
    end

    if(real(R(1)) > 0 || real(R(2)) > 0 || real(R(3)) > 0)
        Key_short(cont) = -1;
        T_S_short(cont) = 0;
        delta_S_short(cont) = 0;
    else 
        if(real(R(1))*real(R(2))*real(R(3)) == 0)
            Key_short(cont) = 0;
            T_S_short(cont) = abs(2*pi/imag(R(1)));
            delta_S_short(cont) = abs(log(1/2)/real(R(1)));
    else
        Key_short(cont) = 1;
        T_S_short(cont) = abs(2*pi/imag(R(1)));
        delta_S_short(cont) = abs(log(1/2)/real(R(1)));
        end
    end
end

    %绘图

    %动力系数
    figure;

    subplot(3,4,1);
    plot(t_save,a22,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向阻尼力矩动力系数\it(a_{22})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,2);
    plot(t_save,a24,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向静稳定力矩动力系数\it(a_{24})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,3);
    plot(t_save,a25,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向操纵力矩动力系数\it(a_{25})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,4);
    plot(t_save,a21,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向速度力矩动力系数\it(a_{21})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,5);
    plot(t_save,a_24,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向阻尼力矩动力系数\it(a^{\prime}_{24})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,6);
    plot(t_save,a34,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向法向力动力系数\it(a_{34})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,7);
    plot(t_save,a35,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('舵面升力动力系数\it(a_{35})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,8);
    plot(t_save,a33,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向法向重力动力系数\it(a_{33})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,9);
    plot(t_save,a31,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向速度法向力动力系数\it(a_{31})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,10);
    plot(t_save,a14,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向切向力动力系数\it(a_{14})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,11);
    plot(t_save,a13,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向切向重力动力系数\it(a_{13})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(3,4,12);
    plot(t_save,a11,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向速度切向力动力系数\it(a_{11})','fontsize',16);
    xlabel('t/s');
    grid on;

    %稳定性
    figure;

    subplot(2,2,1)
    plot(t_save,Key,'LineWidth',1.5);
    hold on;
    plot(t_save,Key_short,'LineWidth',0.75);
    hold off;
    ylim([-1.5,1.5]);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    legend('纵向自由扰动','纵向短周期扰动');
    title('稳定性（-1 = 不稳定，0 = 中立稳定，1 = 稳定）','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(2,2,2)
    plot(t_save,delta_S1,'LineWidth',1.5);
    hold on;
    plot(t_save,delta_S_short,'LineWidth',0.75);
    hold off;
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    legend('纵向自由扰动（短周期）','纵向短周期扰动');
    title('衰减程度','fontsize',16);
    xlabel('t/s');
    ylabel('衰减程度/s');
    grid on;

    subplot(2,2,3)
    plot(t_save,T_S2,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    legend('纵向自由扰动（长周期）');
    title('振荡周期','fontsize',16);
    xlabel('t/s');
    ylabel('振荡周期/s');
    grid on;

    subplot(2,2,4)
    plot(t_save,T_S1,'LineWidth',1.5);
    hold on;
    plot(t_save,T_S_short,'LineWidth',0.75);
    hold off;
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    legend('纵向自由扰动（短周期）','纵向短周期扰动');
    title('振荡周期','fontsize',16);
    xlabel('t/s');
    ylabel('振荡周期/s');
    grid on;

    %短周期系数
    figure;

    subplot(2,2,1)
    plot(t_save,Ka,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向传递系数\it(K_{a})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(2,2,2)
    plot(t_save,Ta,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向时间常数\it(T_{a})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(2,2,3)
    plot(t_save,ksia,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向相对阻尼系数\it(ξ_{a})','fontsize',16);
    xlabel('t/s');
    grid on;

    subplot(2,2,4)
    plot(t_save,T1a,'LineWidth',1.5);
    label = sprintf('t=%.1fs',t_stage1);
    x1 = xline(t_stage1,'--k',{'阶段二',label});
    x1.LabelVerticalAlignment = 'bottom';
    x1.LabelOrientation = 'horizontal';
    x1.LabelHorizontalAlignment = 'left';
    label = sprintf('t=%.1fs',t_stage2);
    x2 = xline(t_stage2,'--k',{'阶段三',label});
    x2.LabelVerticalAlignment = 'bottom';
    x2.LabelOrientation = 'horizontal';
    x2.LabelHorizontalAlignment = 'left';
    title('纵向俯仰角时间常数\it(T_{1a})','fontsize',16);
    xlabel('t/s');
    grid on;








    


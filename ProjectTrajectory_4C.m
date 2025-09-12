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
TG = 0.05;          %高度表时间常数
omegaG = 150;       %舵偏自然频率
ksi = 0.7;          %舵偏阻尼比

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
    H_ast = 2000*cos(0.000314*1.1*x) + 5000;
    i = 0;

    H_mon = H;
    deltaz = 0;
    deltaz_v = 0;
    deltaz_a = 0;
    deltaz_ast = 0;

    while x < 9100
        t = t + dt;
        i = i+1;

        %高度计算
        H = y;
        H_ast_old = H_ast;
        H_ast = 2000*cos(0.000314*1.1*x) + 5000;
        dH_mon = (H - H_mon)/TG*dt;
        H_mon_old = H_mon;
        H_mon = H_mon + dH_mon;
        H_mon_v = H_mon - H_mon_old;
        H_ast_v = H_ast - H_ast_old;

        %动压计算
        T = T0 - 0.0065*H;
        rou = rou0*(T/T0)^4.25588;
        q = 0.5*rou*V^2;
        
        %舵偏角&攻角计算
        deltaz_ast = kH*(H_mon - H_ast) + kH_v*(H_mon_v - H_ast_v) + kphi*(phi) + kphi_v*(phi_v);
        if(abs(deltaz_ast) > deltazlim)
           deltaz_ast = deltaz_ast/abs(deltaz_ast)*deltazlim;
        end

        deltaz_old = deltaz;
        deltaz_v_old = deltaz_v;
        deltaz = deltaz_ast - deltaz_a/(omegaG^2) - 2*ksi*deltaz_v/omegaG;
        if(abs(deltaz) > deltazlim)
           deltaz = deltaz/abs(deltaz)*deltazlim;
        end
        deltaz_v = deltaz - deltaz_old;
        deltaz_a = deltaz_v - deltaz_v_old;
        
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
        phi = phi + dphi;
        x = x + dx;
        y = y + dy;

        %数据存储
        t_save(i) = t;
        x_save(i) = x;
        H_save(i) = y;
        H_ast_save(i) = H_ast;
        H_mon_save(i) = H_mon;
        V_save(i) = V;
        alpha_save(i) = alpha;
        theta_save(i) = theta*180/pi;
        deltaz_save(i) = deltaz;
        deltaz_ast_save(i) = deltaz_ast;
        phi_save(i) = phi;
        t_stage1 = t;
        x_stage1 = x;

    end

    %循环（二阶段）
    while x > 9100 && x < 24000
        t = t + dt;
        i = i+1;

        %高度计算
        H = y;
        H_ast = 3050;  
        dH_mon = (H - H_mon)/TG*dt;
        H_mon_old = H_mon;
        H_mon = H_mon + dH_mon;
        H_mon_v = H_mon - H_mon_old;

        %动压计算
        T = T0 - 0.0065*H;
        rou = rou0*(T/T0)^4.25588;
        q = 0.5*rou*V^2;
        
        %舵偏角&攻角计算
        deltaz_ast = kH*(H_mon - H_ast) + kH_v*(H_mon_v) + kphi*(phi) + kphi_v*(phi_v);
        if(abs(deltaz_ast) > deltazlim)
           deltaz_ast = deltaz_ast/abs(deltaz)*deltazlim;
        end

        deltaz_old = deltaz;
        deltaz_v_old = deltaz_v;
        deltaz = deltaz_ast - deltaz_a/(omegaG^2) - 2*ksi*deltaz_v/omegaG;
        if(abs(deltaz) > deltazlim)
           deltaz = deltaz/abs(deltaz)*deltazlim;
        end
        deltaz_v = deltaz - deltaz_old;
        deltaz_a = deltaz_v - deltaz_v_old;

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
        phi = phi + dphi;
        x = x + dx;
        y = y + dy;
        m = m + dm;

        %数据存储
        t_save(i) = t;
        x_save(i) = x;
        H_save(i) = y;
        H_ast_save(i) = H_ast;
        H_mon_save(i) = H_mon;
        V_save(i) = V;
        alpha_save(i) = alpha;
        theta_save(i) = theta*180/pi;
        deltaz_save(i) = deltaz;
        deltaz_ast_save(i) = deltaz_ast;
        phi_save(i) = phi;
        t_stage2 = t;
        x_stage2 = x;

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

        %高度计算
        H = y;  
        dH_mon = (H - H_mon)/TG*dt;
        H_mon = H_mon + dH_mon;

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
        deltaz_ast = ktheta*(theta - theta_ast) + ktheta_v*(theta_v - theta_ast_v);
        if(abs(deltaz_ast) > deltazlim)
           deltaz_ast = deltaz_ast/abs(deltaz)*deltazlim;
        end

        deltaz_old = deltaz;
        deltaz_v_old = deltaz_v;
        deltaz = deltaz_ast - deltaz_a/(omegaG^2) - 2*ksi*deltaz_v/omegaG;
        if(abs(deltaz) > deltazlim)
           deltaz = deltaz/abs(deltaz)*deltazlim;
        end
        deltaz_v = deltaz - deltaz_old;
        deltaz_a = deltaz_v - deltaz_v_old;
        
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
        H_mon_save(i) = H_mon;
        V_save(i) = V;
        alpha_save(i) = alpha;
        theta_save(i) = theta*180/pi;
        deltaz_save(i) = deltaz;
        deltaz_ast_save(i) = deltaz_ast;
        que_save(i) = que*180/pi;
        phi_save(i) = phi;
        theta_ast_save(i) = theta_ast*180/pi;
        t_stage3 = t;
        x_stage3 = x;
        
    end

    %绘图

    %高度-水平位移
    subplot(2,3,1);
    plot(x_save,H_save,'LineWidth',1);
    hold on;
    plot(x_save,H_ast_save,'LineWidth',0.75);
    hold off;
    hold on;
    plot(x_save,H_mon_save,'LineWidth',0.5);
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
    legend('实际高度','期望高度','表高度','fontsize',12);
    title('\fontsize{16}弹道剖面');
    grid on;

    %高度-时间
    subplot(2,3,2);
    plot(t_save,H_save,'LineWidth',1);
    hold on;
    plot(t_save,H_ast_save,'LineWidth',0.75);
    hold off;
    hold on;
    plot(t_save,H_mon_save,'LineWidth',0.5);
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
    legend('实际高度','期望高度','表高度','fontsize',12);
    xlabel('\fontsize{16}t/s');
    ylabel('\fontsize{16}H/m');
    title('\fontsize{16}高度-时间曲线');
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
    hold on;
    plot(t_save,deltaz_ast_save,'LineWidth',0.5);
    hold off;

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
    legend('实际舵偏角','期望舵偏角','fontsize',12);

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
    title('\fontsize{16}弹道倾角(&视角)-时间曲线');
    grid on;

    


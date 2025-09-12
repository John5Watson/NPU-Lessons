clc
clear 

%定义参数
alpha = [-4,-1,0,3,5,9];
n = 900;                   %定义取样点个数
rou0 = 1.2495;              %基准密度
T0 = 288.15;                %海平面温度
H = 1000;                   %当前高度
T = T0-0.0065*H;
a = (1.4*287*T)^0.5;        %基于量热完全气体假设下的声速计算
rou=rou0*(T/T0)^4.2588;     %当前密度
Ma = 0.4;                   %定义马赫数
v_come = a*Ma;              %计算速度

for i = 1:length(alpha)
    [Cp(i,:),x_,y_,gama(i,:),l(i,:)] = C_p_calculate(n, v_come, alpha(i));
end
titleText_1 = sprintf('%.1f度攻角', alpha(1));
titleText_2 = sprintf('%.1f度攻角', alpha(2));
titleText_3 = sprintf('%.1f度攻角', alpha(3));
titleText_4 = sprintf('%.1f度攻角', alpha(4));
titleText_5 = sprintf('%.1f度攻角', alpha(5));
titleText_6 = sprintf('%.1f度攻角', alpha(6));
plot(x_,Cp(1,:),'LineWidth',2,'DisplayName',titleText_1);
hold on;
plot(x_,Cp(2,:),'LineWidth',2,'DisplayName',titleText_2);
hold on;
plot(x_,Cp(3,:),'LineWidth',2,'DisplayName',titleText_3);
hold on;
plot(x_,Cp(4,:),'LineWidth',2,'DisplayName',titleText_4);
hold on;
plot(x_,Cp(5,:),'LineWidth',2,'DisplayName',titleText_5);
hold on;
% plot(x_,Cp(6,:),'LineWidth',2,'DisplayName',titleText_6);
set(gca, 'YDir', 'reverse');
legend('show'); 
titleText = sprintf('NACA0012翼型%.1f度攻角,%.1f马赫下压强系数分布', alpha, Ma); 
title(titleText);
xlabel('翼型x坐标');
ylabel('压强系数'); 

Y = zeros(1,length(alpha));
m_z = zeros(1,length(alpha));
C_l = zeros(1,length(alpha));
for j = 1:length(alpha)
    Y(j) = rou*v_come*dot(l(j,:),gama(j,:));
    for i = 1:length(l)
        m_z(j) = m_z(j) + l(j,i)*gama(j,i)*x_(i);
    end
    m_z(j) = -2*m_z(j)/v_come;
    C_l(j) = 2*Y(j)/(rou*v_come*v_come);
end
figure(2);
plot(alpha,C_l,'g-+','LineWidth',2,'DisplayName','升力系数','Color','b');
hold on;
plot(alpha,m_z,'r-o','LineWidth',2,'DisplayName','力矩系数','Color','r');
legend('show'); 
clc,clear
% function [Cp,x_,y_,gama,l] = C_p_calculate (n, v_come, alpha)
n = 900;
v_come = 67.3;
alpha = 0;

%定义参数


c_ = 0.12;                  %定义相对厚度

%翼面方程和取样点
x_ = linspace(0,1,n)';      %对x进行n段分割
y_ = zeros(n,1);            %取相同采样点

%根据翼面方程计算y坐标
for i = 1:n
    y_(i) = 5*c_*(0.2969*sqrt(x_(i)) - 0.1260*x_(i) - 0.3516*x_(i)^2 + 0.2843*x_(i)^3 - 0.1015*x_(i)^4);
end

%将x分为均分为上下两部分,以上翼面前缘为起点向前，首尾相接，便于进行涡量等计算
x_upper = x_(1:2:n,1);
x_lower = x_(2:2:n,1);
%首尾相接需要倒置
x_ = [x_upper;flipud(x_lower)];

%将y分为均分为上下两部分,以上翼面前缘为起点向前，首尾相接，便于进行涡量等计算，但有正负关系
y_upper = y_(1:2:n,1);
y_lower = -y_(2:2:n,1);
%首尾相接需要倒置
y_ = [y_upper;flipud(y_lower);];

%计算长度及夹角theta（单位为度）
%与下一片位置信息进行比较，计算角度与距离
%第n片需要首位相接，因此与第1片相连；

l = zeros(n,1);
theta = zeros(n,1);
for i = 1:n
    if i == n
        l(i) = sqrt((y_(i)-y_(1))^2+(x_(i)-x_(1))^2);
        theta(i) = atand((y_(i)-y_(1))/(x_(i)-x_(1)));
    else
        l(i) = sqrt((y_(i)-y_(i+1))^2+(x_(i)-x_(i+1))^2);
        theta(i) = atand((y_(i)-y_(i+1))/(x_(i)-x_(i+1)));
    end
end
theta1 = theta./180.*pi;
beta = 90-(theta-alpha);%角度制
beta1 = beta./180.*pi;

% %控制点处于中点位置
% x = x_;
% y = y_;
% for i = 1:n
%     if i == n
%         x_ (i) = (x(i)+x(1))/2;
%         y_ (i) = (y(i)+y(1))/2;
%     else
%         x_ (i) = (x(i)+x(i+1))/2;
%         y_ (i) = (y(i)+y(i+1))/2;
%     end
% end


%夹角thetaij对n,s偏导的计算
theta_delta_n = zeros(n,n);
theta_delta_s = zeros(n,n);
for i = 1:n
    for j = 1:n
        if i == j
            theta_delta_n(i,j) = 0;
        else
            theta_delta_n(i,j) = (-(y_(i)-y_(j))/((x_(i)-x_(j))^2)*(-sind(theta(i)))+cosd(theta(i))/(x_(i)-x_(j)))...
                /(1+((y_(i)-y_(j))/(x_(i)-x_(j)))^2);
            theta_delta_s(i,j) = (-(y_(i)-y_(j))/((x_(i)-x_(j))^2)*(cosd(theta(i)))+sind(theta(i))/(x_(i)-x_(j)))...
                /(1+((y_(i)-y_(j))/(x_(i)-x_(j)))^2);
        end
    end
end

%解线性方程组计算涡强
solve_gama_n = zeros(n+1,n);
b = zeros(n+1,1);
for i = 1:n
    for j= 1:n
    solve_gama_n(i,j) =theta_delta_n(i,j)*l(j)/(2*pi);
    end     
    b(i) = -v_come*cosd(beta(i));
end
% 根据后缘kutta条件，在解矩阵中加入限制条件
solve_gama_n(n+1,n/2) = 1;
solve_gama_n(n+1,n/2+1) = 1;
gama = linsolve(solve_gama_n,b);

for i = 1:n-1
    gama(i) = (gama(i)+gama(i+1))/2;
%     gama(i) = 0.5*gama(i);
end
% gama(n) = 0;
% gama(1) = 0;
% gama(n/2) = 0;
% gama(n/2) = 0;

%压强系数计算

v_s = -gama;

Cp = zeros(n,1);
for i = 1:n
    Cp(i) = 1 - (v_s(i)/v_come)^2;
end
% v_s = zeros(n,1);
% v_si_ = zeros(n,1);
% for i = 1:n
%     for j = 1:n
%         v_si_(i) = v_si_(i)+theta_delta_s(i,j)*l(j)/(2*pi);
%     end
%     v_s(i) =v_come*sind(beta(i))-v_si_(i)+gama(i)/2;
% end
% C_p = zeros(n,1);
% 
% for i = 1:n
%     C_p(i) = 1-(v_s(i)/v_come)^2;
% end
% 
% end

figure;
plot(x_,y_,'--b');
axis equal;
grid on;
Cp_upper = -Cp(1:n/2+1);
Cp_lower = flip(Cp(n/2:length(Cp)));
hold on;
length = 0:(2/n):1;
plot(length,Cp_upper./10,'linewidth',2);
plot(length,Cp_lower./10,'linewidth',2);
legend('foil','Cp-upper','Cp-lower');
hold off;

rou0 = 1.2495;          %海平面大气密度
T0 = 288.15;            %海平面大气温度
H = 1000;               %海拔高度
Ma_inf = 0.2;           %来流马赫数

T = T0 - 0.0065*H;
rou_inf = rou0*(T/T0)^4.25588;
a = 20.05*T^0.5;
v_inf = Ma_inf*a;
q_inf = 0.5*rou_inf*v_inf^2;

GAMA = sum(l.*gama);
Y = rou_inf*v_inf*GAMA;
M = -rou_inf*v_inf*sum(l.*gama.*x_);
Cy = Y/q_inf;
Mz0 = M/q_inf^2;
MzO = Mz0 - 0.25*Cy;
disp('Cy=');
disp(Cy);
disp('Mz(1/2c)=');
disp(MzO);






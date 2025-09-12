clc,clear

%初值
global c K;
c = 0.12;               %相对最大厚度
n = 1000;               %面涡数
rou0 = 1.2495;          %海平面大气密度
T0 = 288.15;            %海平面大气温度
H = 1000;               %海拔高度
Ma_inf = 0.2;           %来流马赫数
alpha = (-4:0.5:10);    %攻角（组）
K = 10;                 %图像放大倍率

%来流速度计算
global rou_inf v_inf q_inf;
T = T0 - 0.0065*H;
rou_inf = rou0*(T/T0)^4.25588;
a = 20.05*T^0.5;
v_inf = Ma_inf*a;
q_inf = 0.5*rou_inf*v_inf^2;

%计算&绘图
output = zeros(length(alpha),3);
figure;
for i = 1:length(alpha)
%     figure;
    [output(i,1),output(i,2),output(i,3)] = main(n,alpha(i));
end
xlabel('\fontsize{16}x/m');
ylabel('\fontsize{16}0.1*Cp');
title('上下翼面压强系数分布（所有攻角）','FontSize',16);

fit1 = polyfit(alpha',output(:,1),2);
fit2 = polyfit(alpha',output(:,2),2);
fit3 = polyfit(alpha',output(:,3),2);
Cy_fit = polyval(fit1,alpha);
Mz_fit = polyval(fit2,alpha);
Mz0_fit = polyval(fit3,alpha);

figure;
plot(alpha,output(:,1),'bo','linewidth',1);
hold on;
plot(alpha,Cy_fit,'b-','linewidth',2);
plot(alpha,output(:,2),'ro','linewidth',1);
plot(alpha,Mz_fit,'r-','linewidth',2);
hold off;
legend('Cy数据点','Cy拟合曲线','Mz(0.5c)数据点','Mz(0.5c)拟合曲线', ...
    'Location','northwest','fontsize',16);
xlabel('\fontsize{16}α/°');
ylabel('\fontsize{16}Cy&Mz');
title('升力系数/力矩系数-攻角曲线','FontSize',16);
grid on;

Cy_alpha = fit1(2)*180/pi^2;
Mz_alpha = fit2(2)*180/pi;
Mz0_alpha = fit3(2)*180/pi;
Mz0_Cy = Mz0_alpha/(Cy_alpha*pi);

print1 = sprintf('Cy_alpha = %fπ (/rad)',Cy_alpha);
disp(print1);
print2 = sprintf('Mz_alpha = %f (/rad)',Mz_alpha);
disp(print2);
print3 = sprintf('Mz0_alpha = %f (/rad)',Mz0_alpha);
disp(print3);
print4 = sprintf('Mz0_Cy = %f',Mz0_Cy);
disp(print4);

%主函数定义

function [Cy,MzO,Mz0] = main(n,alpha)
global rou_inf v_inf q_inf K;

%翼面方程离散化

%翼面方程和取样点
x = linspace(0,1,n)';      %对x进行n段分割
y = zeros(n,1);            %取相同采样点

%代入翼面方程
for i = 1:n
    y(i) = foil_y(x(i));
end

%翼面整合
x_upper = x(1:2:n,1);
x_lower = x(2:2:n,1);
y_upper = y(1:2:n,1);
y_lower = -y(2:2:n,1);
x = [x_upper;flipud(x_lower)];
y = [y_upper;flipud(y_lower);];
hold on;
plot(x,y,'--b');
axis equal;
grid on;
hold off;

%控制点坐标计算
x_ctrl = zeros(1,n);
y_ctrl = zeros(1,n);
for i = 1:(n-1)
    x_ctrl(i) = (x(i) + x(i+1))/2;
    y_ctrl(i) = (y(i) + y(i+1))/2;
end

%面涡法计算

l = zeros(n,1);
theta = zeros(n,1);
beta = zeros(n,1);
v_inf_n = zeros(n,1);
PDE = zeros(n,n);

%求解速度位
for i = 1:n
    if i == n
        l(i) = sqrt((y(i)-y(1))^2+(x(i)-x(1))^2);
        theta(i) = atan((y(i)-y(1))/(x(i)-x(1)));
    else
    l(i) = sqrt((x(i+1) - x(i))^2 + (y(i+1) - y(i))^2);
    theta(i) = atan((y(i) - y(i+1))/(x(i) - x(i+1)));
    end
    for j = 1:n
        if j == i
            PDE(i,j) = 0;
        else 
            PDE(i,j) = vni(x(i),x(j),y(i),y(j),theta(i));
        end
    end
end
beta = pi/2 - (theta - alpha*(pi/180));
v_inf_n = -v_inf.*cos(beta);


%计算γ
A = zeros(n+1,n);
b = zeros(n+1,1);
for i = 1:n
    for j= 1:n
    A(i,j) = PDE(i,j)*l(j)/(2*pi);
    end     
    b(i) = v_inf_n(i);
end
A(n+1,n/2) = 1;
A(n+1,n/2+1) = 1;
b = v_inf_n;
b(n+1) = 0;
gama = linsolve(A,b);
%γ光顺
for i = 1:(n-1)
    gama(i) = (gama(i) + gama(i+1))/2;
end

%计算压强系数
% vs = v_inf.*sin(beta) + gama./2 - v_inf_n;
vs = -gama;
Cp = 1 - (vs./v_inf).^2;
remove = find(abs(Cp)>5);
for k = 1:length(remove)
Cp(remove(k)) = 0;
end
Cp_upper = -Cp(1:length(x_upper));
Cp_lower = flip(Cp((length(Cp)-length(x_upper)+1):length(Cp)));
hold on;
length_plot = linspace(0,1,n/2)';
plot(length_plot,Cp_upper./K,'linewidth',2);
plot(length_plot,Cp_lower./K,'linewidth',2);
legend('foil','0.1*Cp-upper','0.1*Cp-lower','fontsize',16);
hold off;

%计算力系数、力矩系数
GAMA = sum(l.*gama);
Y = rou_inf*v_inf*GAMA;
M = -rou_inf*v_inf*sum(l.*gama.*x);
Cy = Y/q_inf;
Mz0 = M/q_inf;
MzO = Mz0 + 0.5*Cy;
% disp('Cy=');
% disp(Cy);
% disp('Mz(1/2c)=');
% disp(MzO);

end

%副函数定义

function result = foil_y(x)
    global c;
    result = 5*c*(0.2969*x^0.5 - 0.1260*x - 0.3516*x^2 + 0.2843*x^3 - 0.1015*x^4);
end

function result = vni(xi,xj,yi,yj,thetai)
    result = (-(yi - yj)/((xi - xj)^2)*(-sin(thetai))+cos(thetai)/ ...
        (xi - xj))/(1 + ((yi - yj)/(xi - xj))^2);
end
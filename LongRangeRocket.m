

%初始化
clc,clear
 
global dvdt_test dxdt_test dydt_test q_test m_test gr_test r_test pH_test rou_test Pe_test
dvdt_test = [];
dxdt_test = [];
dydt_test = [];
q_test = [];
m_test = [];
gr_test = [];
r_test = [];
pH_test = [];
rou_test = [];
Pe_test = [];

global t_save phi_pr_save phi_save alpha_save delta_phi_save h_save
t_save = 0;
phi_pr_save = [];
phi_save = [];
alpha_save = [];
delta_phi_save = [];
h_save = [];


%初始状态
global a phi_old
t0 = 0;                      %火箭飞行时间，s
theta0 = pi/2;               %初始弹道倾角，弧度制
v0 = 0;                      %火箭初始速度，m/s
x0 = 0;                      %火箭在地面发射坐标系下的x坐标，m
y0 = 0;                      %火箭在地面发射坐标系下的y坐标，m
z0 = 0;                      %火箭在地面发射坐标系下的z坐标，m
lphi0 = 19 + 19/60;%N        %发射点地心纬度
lambda0 = 109 + 48/60;%E     %发射点经度      
A0 = 30;                     %发射方位角，角度制
a = 0;
phi_old = pi/2;


%参数
global m0 m_v mf R Pe SM Cy2alpha a0phi mz2alpha roue L p0 Se Pe0 Mz2delta
m0 = 23000;                 %起飞质量，kg
m_v = 100;                  %燃料质量流率，kg/s
a0phi = 0.5;                %俯仰角度增益系数
a0psi = 0.5;                %偏航角度增益系数
Pe = 3e5;                   %海平面推力，N
Pe_Isp = Pe;
Pe0 = Pe;
mf = 1500;                  %结构质量，kg
mz2alpha = -0.12;           %静稳定力矩系数，角度制
omegae = 7.292115e-5;       %地球自转角速度
L = 15;                     %火箭参考长度，m
mz2Cy = 0.1;                %静稳定度
roue = 7;                   %火箭发动机喷口界面距质心距离，m
xg = 8;                     %火箭质心距头部距离，m
Se = 0.1;                   %发动机喷口面积，m^2
SM = 3.14;                  %气动参考面积，m^2
pt = 4e5;                   %发动机出口压强
p0 = 101325;
R = 6378145;                %地球赤道半径，m
Cy2alpha = -mz2alpha/mz2Cy; %升力线斜率，角度制
Mz2delta = Pe*roue;


%ODE45迭代
tspan = [0,215];
input = [v0,theta0,x0,y0,0,0,0];
options = odeset('MaxStep', 5e-1);
[t,output] = ode45(@odefun, tspan, input, options);
v_save = output(:,1);
theta_save = output(:,2).*(180/pi);     %转角度制
x_save = output(:,3);
y_save = output(:,4);
DELTAv1k_save = output(:,5);
DELTAv2k_save = output(:,6);
DELTAv3k_save = output(:,7);
t_save(1) = [];
DELTA_phi = phi_save - phi_pr_save;


%验证齐奥尔科夫斯基公式
Isp = Pe_Isp/m_v;
vidk = -Isp*log(mf/m0);
vtk = vidk - DELTAv1k_save(end) - DELTAv2k_save(end) - DELTAv3k_save(end);
disp("齐奥尔科夫斯基公式求得vidk=");
disp(vidk);
disp("引力速度损失Δv1k=");
disp(DELTAv1k_save(end));
disp("大气阻力速度损失Δv2k=");
disp(DELTAv2k_save(end));
disp("静压速度损失Δv3k=");
disp(DELTAv3k_save(end));
disp("速度损失修正后求得vtk=vidk-Δv1k-Δv2k-Δv3k=");
disp(vtk);
disp("仿真求得火箭主动段末速度vk=");
disp(v_save(end));


%绘图
figure;
plot(x_save,y_save,'LineWidth',1.5);
legend ("x-y",'FontSize',16);
xlabel('横向位移(m)','FontSize',24);
ylabel('纵向位移(m)','FontSize',24);
grid on

figure;
hold on
plot(t,x_save,'LineWidth',1.5);
plot(t,y_save,'LineWidth',1.5);
plot(t_save,h_save,'LineWidth',1.5);
hold off
legend ("x","y","h",'FontSize',16);
xlabel('时间(s)','FontSize',24);
ylabel('高度(m)','FontSize',24);
grid on

figure;
hold on
plot(t_save,phi_pr_save,'LineWidth',1.5);
plot(t_save,phi_save,'LineWidth',1.5);
plot(t_save,DELTA_phi,'LineWidth',1.5);
plot(t_save,alpha_save,'LineWidth',1.5);
plot(t,theta_save,'LineWidth',1.5);
plot(t_save,delta_phi_save,'LineWidth',1.5);
hold off
legend ("φ_{pr}","φ","Δφ_{pr}","α","θ","δ_{φ}",'FontSize',16);
xlabel('时间(s)','FontSize',24);
ylabel('角度(°)','FontSize',24);
grid on

figure;
hold on
plot(t,v_save,'LineWidth',1.5);
plot(t,DELTAv1k_save,'LineWidth',1.5);
plot(t,DELTAv2k_save*10,'LineWidth',1.5);
plot(t,DELTAv3k_save*10,'LineWidth',1.5);
hold off
legend ("v_{pr}","Δv_{1k}","Δv_{2k}(X10)","Δv_{3k}(X10)",'FontSize',16);
xlabel('时间(s)','FontSize',24);
ylabel('速度损失(m/s)','FontSize',24);
grid on


%ODE45微分方程
function ODE = odefun(t, input)
v = input(1);
theta = input(2);
x = input(3);
y = input(4);

ODE = zeros(7,1);
ODE(1) = dvdt(t,theta,v,x,y);
ODE(2) = dthetadt(t,theta,v,x,y);
ODE(3) = dxdt(v,theta);
ODE(4) = dydt(v,theta);
ODE(5) = dDELTAv1kdt(theta,x,y);
ODE(6) = dDELTAv2kdt(t,theta,v,x,y);
ODE(7) = dDELTAv3kdt(t,x,y);

global t_save trigger
if t_save(end) < t
    t_save = [t_save;t];
    trigger = 1;
end
end


%公式
%引力速度损失
function result = dDELTAv1kdt(theta,x,y)
global R
h = r(x,y) - R;

result = -gr(h)*(y + R)/r(x,y)*sin(theta) - gr(h)*x/r(x,y)*cos(theta);
end

%大气阻力损失
function result = dDELTAv2kdt(t,theta,v,x,y)
global R SM
h = r(x,y) - R;

result = Cx(alpha(t,theta,v,x,y))*q(h,v)*SM/m(t);
end

%静压速度损失
function result = dDELTAv3kdt(t,x,y)
global R Se p0 pH_test Pe Pe_test Pe0
h = r(x,y) - R;
pH = p0*power(10,-h/18400/(1+100/273));

result = Se*pH/m(t);
Pe = Pe0 + Se*(p0 - pH);
pH_test = [pH_test, pH];
Pe_test = [Pe_test, Pe];
end

%加速度
function result = dvdt(t,theta,v,x,y)
global Pe SM R dvdt_test
h = r(x,y) - R;
a = alpha(t,theta,v,x,y);

result = (Pe - Cx(a)*q(h,v)*SM)/m(t) + gr(h)*(y + R)/r(x,y)*sin(theta) + gr(h)*x/r(x,y)*cos(theta);
dvdt_test = [dvdt_test, result];

global alpha_save h_save trigger
if trigger == 1
    alpha_save = [alpha_save;a*180/pi];
    h_save = [h_save;h];
end
end

%角速度
function result = dthetadt(t,theta,v,x,y)
global Pe SM R Cy2alpha a0phi
h = r(x,y) - R;
a = alpha(t,theta,v,x,y);
phi = theta + a;
phipr = phi_pr(t);
delta_phi = a0phi*(phi - phipr);

if v ~= 0
    result = ((Pe + 11/14*Cy2alpha*q(h,v)*SM*180/pi)*a/m(t) + gr(h)*(y + R)/r(x,y)*cos(theta) ...
    - gr(h)*x/r(x,y)*sin(theta) + Pe*sin(delta_phi)/m(t))/v;
else
    result = 0;
end

global phi_save phi_pr_save delta_phi_save trigger
if trigger == 1
    phi_save = [phi_save;phi*180/pi];
    phi_pr_save = [phi_pr_save;phipr*180/pi];
    delta_phi_save = [delta_phi_save;delta_phi*180/pi];
end
end

%x速度
function result = dxdt(v,theta)
global dxdt_test

result = v*cos(theta);
dxdt_test = [dxdt_test, result];
end

%y速度
function result = dydt(v,theta)
global dydt_test

result = v*sin(theta);
dydt_test = [dydt_test, result];

global trigger
if trigger == 1
    trigger = 0;
end
end

%攻角，弧度制
function result = alpha(t,theta,v,x,y)
global R a0phi mz2alpha SM L Mz2delta
h = r(x,y) - R;
Aphi = a0phi*Mz2delta/(-mz2alpha*q(h,v)*SM*L + a0phi*Mz2delta);
% Aphi = a0phi*Pe*(-7)/(2*mz2alpha*q(h,v)*SM*L + a0phi*Pe*(-7));

result = Aphi*(phi_pr(t) - theta);
end

%阻力系数，角度制
function result = Cx(alpha)
result = 0.02 + 0.005*(alpha*180/pi)^2;
end

%飞行程序角，弧度制
function result = phi_pr(t)
t1 = 10; 
t2 = 100; 
t3 = 215;
phi_ = 30/180*pi;       %自定义目标程序角

if t < t1
    result = pi/2;
elseif t <= t2
    result = pi/2 + (pi/2 - phi_)*(((t - t1)/(t2 - t1))^2 - 2*(t - t1)/(t2 - t1));
elseif t <= t3
    result = phi_ - (t - t2)*(phi_/(t3 - t2));
else
    result = 0;
end
end

%动压
function result = q(h,v)
global q_test rou_test
T0 = 288.15;        %海平面大气温度
rou0 = 1.2495;      %海平面大气密度
if h <= 11000
    T = T0 - 0.0065*h;
    rou = rou0*(T/T0)^4.25588;
elseif h > 11000 && h <= 20000
    rou = 0.36392*exp((-h + 11000)/6341.62);
else
    T = 216.65 + 0.001*(h - 20000);
    rou = 0.088035*(T/216.65)^-35.1632;
end

result = 0.5*rou*v^2;
q_test = [q_test, result];
rou_test = [rou_test, rou];
end

%质量
function result = m(t)
global m0 m_v mf Pe m_test

if m0 - m_v*t > mf
    result = m0 - m_v*t;
else 
    result = mf;
    Pe = 0;
end
m_test = [m_test, result];
end

%引力加速度
function result = gr(h)
global R gr_test
fM = 3.986005e14;
r = h + R;

result = -fM/r^2;
gr_test = [gr_test, result];
end

%地心矢径
function result = r(x,y)
global R r_test

result = (x^2 + (y + R)^2)^0.5;
r_test = [r_test, result];
end





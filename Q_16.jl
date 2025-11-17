using TyControlSystems
using TyMath
using TyBase
using TyPlot

s = tf('s');
G = (-2*s^2+3*s-9)/(s^3+3.2*s^2+1.61*s+3.03);
H1 = c2d(G,0.01);
H2 = c2d(G,0.1);
H3 = c2d(G,1);

#单位阶跃响应
yc, tc, = step(G, 100,fig = false);
yd1, td1, = step(H1,100,fig = false);
yd2, td2, = step(H2,100,fig = false);
yd3, td3, = step(H3,100,fig = false);

##绘制曲线
#分块图
figure;
subplot(2, 2, 1);
plot(tc, yc);
grid("on");
title("连续系统单位阶跃响应");

subplot(2, 2, 2);
plot(td1, yd1);
grid("on");
title("采样周期为 0.01 秒的离散系统单位阶跃响应");

subplot(2, 2, 3);
plot(td2, yd2);
grid("on");
title("采样周期为 0.1 秒的离散系统单位阶跃响应");

subplot(2, 2, 4);
plot(td3, yd3);
grid("on");
title("采样周期为 1 秒的离散系统单位阶跃响应");

#合并图
figure(2)
    step(G,H1,H2,H3,100);
    grid("on");

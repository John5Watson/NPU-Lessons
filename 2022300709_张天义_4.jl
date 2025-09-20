using TyPlot
using TyBase
using TyMath

# 定义学号最后一位
last_digit = 9

# 设置 theta 的范围
theta1=0:(pi/100):4*pi
rho1=sin.(theta1.*(8/3))./(((-cos.(theta1.*1.5)).^2).+last_digit)
theta2=0:(pi/100):6*pi
rho2=sin.(theta2.*(8/3))./(((-cos.(theta2.*1.5)).^2).+last_digit)

# 绘制极坐标曲线
figure()
# 第一张图：theta 范围 (0, 4π)
subplot(2,1,1)
polarplot(theta1, rho1,"--r*",markevery=10);
title("(0, 4π)");

# 第二张图：theta 范围 (0, 6π)
subplot(2,1,2)
polarplot(theta2, rho2,"-.go",markevery=10)
title("(0, 6π)");
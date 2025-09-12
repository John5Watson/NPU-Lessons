%参数
pb=35.7;
deltap=2.5;
ta=300;
pa=95.7;
k=1.4;
Rg=287;

d=7e-3;
D=54e-3;
roua=1.177;

a=(k-1)/k;
p1=pa-0.97*deltap;

beta=d/D;

%数据记录
x=[0,1,2,3,4,5,10,15,20,25,30,35];
% p=[3.4,16.8,35.2,48.5,56.7,54.0,56.1,62.6,67.2,69.6,66.7,57.7];
% p=[3.5,20.7,43.9,53.1,57.1,54.2,56.4,63.5,67.4,71.2,72.5,70.9];
p=[3.5,21.1,34.6,51.7,56.1,54.4,57.3,64.0,67.4,70.2,67.5,64.4];
p=-1.*p;

%计算
px=p+pa;
b=px./p1;
ux=sqrt(2*Rg/a*ta*(1-b.^a));
Tx=ta*b.^a;
ax=sqrt(k*Rg.*Tx);
Mx=ux./ax;

C=0.5961+0.0261*beta^2+0.011*(0.75-beta)*(2.8-D*1000/25.4);
e=1-(0.351+0.256*beta^4+0.93*beta^8)*(1-((pa-deltap)/pa)^(1/k));
m=C/sqrt(1-beta^4)*e*pi*d^2/4*sqrt(2*deltap*1000*roua);

%绘图
gridpx=0.02.*px;

yyaxis left;
plot(x,Mx,'-xb','LineWidth',2,'markersize',8);
ylabel('Mx/Ma','fontsize',24);
ylim([0,1.1*max(max(Mx),max(gridpx))]);
hold on;

yyaxis right;
plot(x,gridpx,'-or','LineWidth',2,'markersize',8);
ylabel('0.02px/Pa','fontsize',24);
ylim([0,1.1*max(max(Mx),max(gridpx))]);
hold off;

str0='超声速喷管流动 ·m=';
str=[str0,num2str(m,'%.4e')];
title(str,'fontsize',32);
set(gca,'fontsize',16);
xlabel('X/mm','fontsize',24);
xlim([0,35]);
legend('Mx-x','px-x','fontsize',24);
grid on;




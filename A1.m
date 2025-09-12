%定参
rw=0.0262;
pa=95900;
ta=26.0;
t1=25.0;

%变量
tuo=40.73;
t2=120.6;
deltah=4.0;
Q=30.6;

%计算
Gg=((1-rw)*(pa+deltah*9.8)*0.01/tuo)/(287*(ta+273.15));
Gw=((rw)*(pa+deltah*9.8)*0.01/tuo)/(461.19*(ta+273.15));

fun=@(T) 1897-0.47057*T+0.0012*T.^2;
Qw=Gw*integral(fun,273.15+t1,273.15+t2);

Qg=Q-Qw;
cpm=Qg/Gg/(t2-t1);

e=abs(cpm-1004)/1004*100;

disp('cpm=');
disp(cpm);
disp('ε=%');
disp(e);


%变参
ha=184.0;
hc=46.0;

%计算
k=ha/(ha-hc);
e=abs(1.4-k)/1.4*100;

disp('κ=');
disp(k);
disp('ε=');
disp(e);
clc,clear
load census;
f=fit(cdate,pop,'poly2');
plot(f,cdate,pop);
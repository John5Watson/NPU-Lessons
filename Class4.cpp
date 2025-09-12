#include<stdio.h>
#include<math.h>

#define f(x) (4/(1+(x)*(x)))

double a=0,b=0,eps=0;
int n=0;

void trapezium()        //复化梯形求积
{
    double h=0,T=0,T0=0,F=0;
    int N=0;

    N=1;        //第一次计算
    h=(b-a)/2;
    T0=h*(f(a)+f(b));
    F=f(a+h);
    T=T0/2+h*F;

    for(N*=2,h/=2;fabs(T-T0)>eps;N*=2,h/=2)     //循环计算积分
    {
        T0=T,F=0;
        for(int i=1;i<=N;i++)
        {
            F+=f(a+(2*i-1)*h);
        }
        T=0.5*T0+h*F;
    }

    N/=2;
    printf("复化梯形:\nNode Count=%d,Result=%.8lf\n",N,T);     //输出步数及结果

    return;
}

void simpson()      //复化辛普森求积
{
    double h=0,S=0,S0=0,F0=0,F1=0,F2=0;
    int N=0;

    N=2;        //第一次计算
    h=(b-a)/4;
    F0=f(a)+f(b);
    F1=f((a+b)/2);
    S0=(b-a)*(F0+4*F1)/6;
    F2=f(a+h)+f(a+3*h);
    S=h*(F0+2*F1+4*F2)/3;

    for(N*=2,h/=2;fabs(S-S0)>eps;N*=2,h/=2)     //循环计算积分
    {
        S0=S,F1=F1+F2,F2=0;
        for(int i=1;i<=N;i++)
        {
            F2+=f(a+(2*i-1)*h);
        }
        S=h*(F0+2*F1+4*F2)/3;
    }

    N/=4;
    if(N<=2) N=2;
    printf("复化辛普森:\nNode Count=%d,Result=%.8lf\n",N,S);     //输出步数及结果

    return;
}

int main()
{
    printf("请输入积分端点(a b):");     //输入区间端点及精度
    scanf("%lf %lf",&a,&b);
    printf("请输入误差限:");
    scanf("%d",&n);
    n*=-1;
    eps=pow(10,n);
    printf("输入项:端点(a,b)=(%lf,%lf),误差限eps=10^%d=%lf\n",a,b,n,eps);

    trapezium();
    simpson();

    return 0;
}


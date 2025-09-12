#include<stdio.h>
#include<math.h>

#define e 2.718281828459045
#define f(x)    (pow(e,x)-3-x)   //原函数
#define f1(x)   (pow(e,x)-1)    //原函数一阶导
#define f2(x)   (pow(e,x))   //原函数二阶导
//#define eps 0.00001     /* 求解精度 */
#define x1  1    /* 区间左端点 */
#define x2  2    /* 区间右端点 */
//#define x0  2    //初值

double Nn(double x)
    {
        return (x-f(x)/f1(x));      //由第n项计算第n+1项
    }


int main()
{
    int n=0;
    double x0=0,eps=0;
    printf("请输入初值:");
    scanf("%lf",&x0);
    printf("请输入误差限:");
    scanf("%d",&n);
    n*=-1;
    printf("输入项:初值x0=%lf,误差限eps=10^%d\n",x0,n);
    eps=pow(10,n);

    if(f(x0)*f2(x0)<=0)
    {
        printf("ERROR\n");
        return 0;
    }

    double Nn1=Nn(x0);
    printf("Step[1]=%lf\n",Nn1);
    int i=2;
    for(;fabs(Nn(Nn1)-Nn1)>eps;i++)
    {
        Nn1=Nn(Nn1);
        printf("Step[%d]=%lf\n",i,Nn1);
    }
    printf("Step Count=%d,Root=%lf\n",i-1,Nn1);

    return 0;
}

#include<stdio.h>
#include<math.h>

#define f(y) (-50*(y))

double y00=0,a=0,b=0;
double h[16]={};
int N=0;

void input()        //从文件读取各输入项
{
    FILE *fp;
    fp=fopen("Class5.txt","r");

    fscanf(fp,"%lf",&y00);     //初值y00

    fscanf(fp,"%d",&N);     //步长个数
    for(int i=0;i<=N-1;i++)     //输入步长h
    {
        fscanf(fp,"%lf",&h[i]);
    }

    fscanf(fp,"%lf %lf",&a,&b);     //x下限a及上限b

    return;
}

void output()       //输出初始数据
{
    printf("Input:\n");

    printf("y0=%lf\n",y00);

    for(int i=0;i<=N-1;i++)
    {
        printf("h[%d]=%lf\n",i+1,h[i]);
    }

    printf("%lf<x<=%lf\n\n",a,b);

    return;
}

int check(double h)     //检查步长h下算法稳定性
{
    if(fabs(1-50*h+1250*h*h)>1) return 1;
    else return 0;
}

int main()
{
    input();
    output();

 printf("Output:\n");
    for(int i=0;i<=N-1;i++)
    {
        printf("h[%d]=%lf:",i+1,h[i]);

        if (check(h[i])) printf("[不稳定]\n");     //若不稳定，在输出内提示
        else printf("\n");

        double K1=0,K2=0,y1=0,yn=y00;       //第一个y(x)计算并输出
        K1=f(yn);
        K2=f(yn+h[i]*K1);
        y1=yn+0.5*h[i]*(K1+K2);
        printf("y[%.4lf]=%.16e\n",h[i],y1);

        int j=2;
        for(double l=a+h[i];l<=b;l+=h[i],j++)       //循环计算后续y(x)
        {
            yn=y1;
            K1=f(yn);
            K2=f(yn+h[i]*K1);
            y1=yn+0.5*h[i]*(K1+K2);
            //printf("y[%.4lf]=%.16e\n",l,y1);
        }
            printf("y[10]=%.16e\n",y1);     //输出最后一个y(x)
    }

    return 0;
}

#include<stdio.h>
#include<math.h>
#include<stdlib.h>

int N=0,count=0;
double x[64]={},y[64]={},x0[16]={},L[64]={},l[16]={};       //x、y为输入函数表，x0为待求点，L为某x0时插值基函数的值，l为某x0时拉格朗日插值函数的值

void input()        //从文件读取各输入项
{
    FILE *fp;
    fp=fopen("Class3.txt","r");

    fscanf(fp,"%d",&N);     //函数表大小

    for(int i=0;i<=N-1;i++)     //输入x
    {
        fscanf(fp,"%lf",&x[i]);
    }

    for(int i=0;i<=N-1;i++)     //输入y
    {
        fscanf(fp,"%lf",&y[i]);
    }

    fscanf(fp,"%d",&count);     //输入x0的数量

    for(int i=0;i<=count-1;i++)     //输入x0
    {
        fscanf(fp,"%lf",&x0[i]);
    }

    return;
}

void output()       //输出初始数据
{
    printf("Input:\nx=\t");

    for(int i=0;i<=N-1;i++)
    {
        printf("%lf\t",x[i]);
    }

    printf("\ny=\t");
    for(int i=0;i<=N-1;i++)
    {
        printf("%lf\t",y[i]);
    }

    printf("\nx0=\t");
    for(int i=0;i<=count-1;i++)
    {
        printf("%lf\t",x0[i]);
    }

    printf("\n\n");

    return;
}

double sum(double a,int i)      //计算插值多项式的值
{
    double sum=1;

    for(int j=0;j<=N-1;j++)
    {
        if (j!=i) sum*=(a-x[j]);
    }

    return sum;
}

double lagrange(int j,int i)        //计算插值基函数的值
{
    return (sum(x0[j],i)/sum(x[i],i));
}

int main()
{
    input();
    output();
    printf("Result:\n");

    for (int j=0;j<=count-1;j++)
    {
        for(int i=0;i<=N-1;i++)     //计算某x0时插值基函数的值
        {
            L[i]=lagrange(j,i);
        }

        for(int i=0;i<=N-1;i++)     //计算某x0时拉格朗日插值函数的值
        {
            l[j]+=L[i]*y[i];
        }

        printf("x=%lf\ty=%lf\n",x0[j],l[j]);        //列表输出
    }

    return 0;
}

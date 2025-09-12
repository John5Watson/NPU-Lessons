#include<stdio.h>
#include<math.h>
#include<stdlib.h>

//#define N 3     //矩阵大小
//#define n -5     //求解精度n

int N=0,n=0;
double A[64][64]={};     //系数矩阵A
double b[64]={};      //右端向量b
double x0[64]={},x1[64]={};     //x0为初始向量
double eps;       //求解精度

void input()        //从文件输入数据
{
    FILE *fp;
    fp=fopen("Class2.txt","r");

    fscanf(fp,"%d",&N);     //矩阵大小N

    for(int i=0;i<=N-1;i++)     //系数矩阵A
    {
        for(int j=0;j<=N-1;j++)
        {
            fscanf(fp,"%lf",&A[i][j]);
        }
    }

    for(int i=0;i<=N-1;i++)     //右端向量b
    {
        fscanf(fp,"%lf",&b[i]);
    }

    for(int i=0;i<=N-1;i++)     //初始向量x0
    {
        fscanf(fp,"%lf",&x0[i]);
    }

    fscanf(fp,"%d",&n);     //求解精度n
    n*=-1;
    eps=pow(10,n);

    return;
}

void output()       //输出初始数据
{
    printf("Input:\n");

    printf("A[%d][%d]=\n",N,N);
    for(int i=0;i<=N-1;i++)
    {
        printf("[");
        for(int j=0;j<=N-1;j++)
        {
            printf("%lf\t",A[i][j]);
        }
        printf("]\n");
    }

    printf("b[%d]=\n[",N);
    for(int i=0;i<=N-1;i++)
    {
        printf("%lf\t",b[i]);
    }
    printf("]\n");


    printf("eps=10^%d=%lf\n\n",n,eps);

    return;
}

double max(double x[64])     //求x向量的无限范数
{
    double max=x[0];

    for(int i=0;i<=N-1;i++)
    {
        if(max<x[i]) max=x[i];
    }

    return max;
}

double sum(double A[64][64],double x[64],int start,int end,int i)      //求Aij*xj从j下限到上限之和
{
    double sum=0;

    for(int j=start;j<=end;j++)
    {
        sum=sum+A[i][j]*x[j];
    }

    return sum;
}

int main()
{
    input();
    output();

    for(int i=0;i<=N-1;i++)     //GS法计算第一个x1向量
    {
        x1[i]=(b[i]-sum(A,x1,0,i-1,i)-sum(A,x0,i+1,N-1,i))/A[i][i];
    }

    for(;fabs(max(x1)-max(x0))>eps;)        //GS法计算x1
    {
        for(int i=0;i<=N-1;i++)
        {
            x0[i]=x1[i];
        }

        for(int i=0;i<=N-1;i++)
        {
            x1[i]=(b[i]-sum(A,x1,0,i-1,i)-sum(A,x0,i+1,N-1,i))/A[i][i];
        }

    }

    printf("Result:\n");        //输出结果
    printf("x[%d]=\n[",N);
    for(int i=0;i<=N-1;i++)
    {
        printf("%lf\t",x1[i]);
    }
    printf("]\n");

    return 0;
}

#include<stdio.h>
#include<math.h>
#include<stdlib.h>

int N=0,n=0,count=0;
double eps=0;
double *data=(double*)malloc(sizeof(double)*81);
double *ai,*aj,*bi,*x0i,*x1i;
double *data0=data,*a0=data,*b0,*x00,*x10;

void input()
{
    FILE *fp;
    fp=fopen("Class2.txt","r");

    fscanf(fp,"%d",&N);     //读取矩阵大小
    printf("N:%d\n",N);

    for(count=1;fgetc(fp)!=';';count++)     //读取A矩阵
    {
        realloc(data,count*sizeof(double));
        fscanf(fp,"%lf",data);
        printf("a:%lf\n",*data);
        data++;
    }

    realloc(data,(count+3*N)*sizeof(double));
    b0=data;
    x00=data+N;
    x10=data+2*N;

    for(;fgetc(fp)!=';';)       //读取b向量
    {
        fscanf(fp,"%lf",data);
        printf("b:%lf\n",*data);
        data++;
    }

    for(;fgetc(fp)!=';';)       //读取x0向量
    {
        fscanf(fp,"%lf",data);
        printf("x0:%lf\n",*data);
        data++;
    }

    fscanf(fp,"%d",&n);     //读取误差限n值
    n*=-1;
    eps=pow(10,n);
    printf("n,eps:%d,%lf\n\n",n,eps);

    fclose(fp);
}

void output()
{
    data=data0;

    printf("Input:\n");
    printf("A[N][N]=\n");
    int i=0;
    for(ai=a0;i<=N-1;ai+=N,i++)
    {
        int j=0;
        for(aj=ai;j<=N-1;aj++,j++)
        {
            printf("%lf\t",*aj);
        }
        printf("\n");
    }
    printf("\n");

    printf("b[N]=\n[");
    i=0;
    for(bi=b0;i<=N-1;bi++,i++)
    {
        printf("%lf\t",*bi);
    }
    printf("]\n\n");

    printf("x0[N]=\n[");
    i=0;
    for(x0i=x00;i<=N-1;x0i++,i++)
    {
        printf("%lf\t",*x0i);
    }
    printf("]\n\n");

    printf("eps=10^%d=%lf\n\n",-1*n,eps);

    return;
}

double max(double *x)     //求x向量的无限范数
{
    double max=*x;
    for(int i=0;i<=N-1;x++,i++)
    {
        if(max<*x) max=*x;
    }
    return max;
}

double sum(double *x,double *x0,int start,int end,int i)      //求Aij*xj从j下限到上限之和
{
    double sum=0;
    aj=a0;
    ai=a0+i*N;
    x=x0+start*N;
    for(int j=start;j<=end;aj++,x++,j++)
    {
        sum=sum+(*aj)*(*x);
    }
    return sum;
}

int main()
{
    input();
    output();

    printf("Result:\n");

    ai=a0,aj=a0,bi=b0,x0i=x00,x1i=x10;
    for(int i=0;i<=N-1;x1i++,bi++,x0i++,ai+=N,i++)
    {
        *x1i=(*bi-sum(x1i,x10,0,i-1,i)-sum(x0i,x00,i+1,N-1,i))/(*ai);
        printf("%f\t",*x1i);
    }
    printf("\n");

    free(data0);
    return 0;
}


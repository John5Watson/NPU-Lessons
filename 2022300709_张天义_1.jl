# 定义矩阵A和B
id = 709   # 学号后三位
A = [5 2 2 3;
     2 3 25 78;
     3 1 3 9;
     1 8 7 id]

B = [2+5im 3+4im 4+3im 5+2im;
     4+1im 3+2im 2+3im 1+4im;
     6+7im 4+3im 3+4im 7+6im;
     8+6im 9+4im 4+9im 6+8im]

# 计算矩阵乘积C
C = A * B

# 提取C矩阵右下角2x3子矩阵赋给D
D = C[end-1:end, end-2:end]

println("D=")
display(D)
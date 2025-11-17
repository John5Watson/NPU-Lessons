using LinearAlgebra

# 主函数
function main()
    id = 709
    solve1(id)
    solve2(id)
end

function solve1(id)
    # 定义矩阵和向量
    A1 = [7  2   1  -2;
          9  15  3  -2;
         -2 -2  11   5;
          1  3   2  id]
    
    b1 = [4; 7; -1; 0]
    
    # 求解 X
    X1 = A1 \ b1
    
    # 验证解的正确性
    residual1 = A1 * X1 - b1  # 计算残差
    
    println("第一个方程的解 X1:")
    println(X1)
    println("残差:")
    println(residual1)
    println()
end

function solve2(id)
    # 定义矩阵和右侧矩阵
    A2 = [1   3   2  id;
          7   2   1  -2;
          9  15   3  -2;
         -2  -2  11   5]
    
    B2 = [9   0;
          6   4;
         11   7;
         -2  -1]
    
    # 求解 X
    X2 = A2 \ B2
    
    # 验证解的正确性
    residual2 = A2 * X2 - B2  # 计算残差
    
    println("第二个方程的解 X2:")
    println(X2)
    println("残差:")
    println(residual2)
    println()
end

# 运行主函数
main()

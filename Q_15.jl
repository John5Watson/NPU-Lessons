using LinearAlgebra

# 系统1
A1 = [-3 1 2 1;
       0 -4 -2 -1;
       1 2 -1 1;
      -1 -1 1 -2]
B1 = [1 0;
      0 2;
      0 3;
      1 1]
C1 = [1 2 2 -1;
      2 1 -1 2;
      1 2 -1 1]

# 系统2
A2 = [1 3 2;
      0 2 0;
      0 1 3]
B2 = [2 1;
      1 1;
     -1 -1]
C2 = [1 0 3;
      2 1 0]

# 判断系统稳定性函数
function check_stability(A)
    eigvals_A = eigvals(A)
    stable = all(real.(eigvals_A) .< 0)
    return stable, eigvals_A
end

# 判断系统可控性函数
function check_controllability(A, B)
    n = size(A, 1)
    # 构造可控性矩阵
    Qc = B
    for i in 1:n-1
        Qc = [Qc A^i*B]
    end
    # 判断秩是否等于系统阶数
    controllable = rank(Qc) == n
    return controllable, Qc
end

# 判断系统可观性函数
function check_observability(A, C)
    n = size(A, 1)
    # 构造可观性矩阵
    Qo = C
    for i in 1:n-1
        Qo = [Qo; C * A^i]
    end
    # 判断秩是否等于系统阶数
    observable = rank(Qo) == n
    return observable, Qo
end

# 分析系统1
stable1, eigvals1 = check_stability(A1)
controllable1, Qc1 = check_controllability(A1, B1)
observable1, Qo1 = check_observability(A1, C1)

# 分析系统2
stable2, eigvals2 = check_stability(A2)
controllable2, Qc2 = check_controllability(A2, B2)
observable2, Qo2 = check_observability(A2, C2)

# 打印结果
println("系统1分析结果:")
println("  特征值: ", eigvals1)
println("  稳定性: ", stable1 ? "稳定" : "不稳定")
println("  可控性: ", controllable1 ? "可控" : "不可控")
println("  可观性: ", observable1 ? "可观" : "不可观")

println("\n系统2分析结果:")
println("  特征值: ", eigvals2)
println("  稳定性: ", stable2 ? "稳定" : "不稳定")
println("  可控性: ", controllable2 ? "可控" : "不可控")
println("  可观性: ", observable2 ? "可观" : "不可观")

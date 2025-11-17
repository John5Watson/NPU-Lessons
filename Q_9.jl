using Optim, JuMP, Ipopt

println("=" ^ 60)
println("问题9：求解Rosenbrock函数的最小值")
println("=" ^ 60)

# 定义Rosenbrock函数
function rosenbrock(x)
    return 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
end

# 使用Optim包求解
function solve_with_optim()
    println("\n方法1：使用Optim包求解")
    println("目标函数：f(x) = 100(x2 - x1²)² + (1 - x1)²")
    println("初始点：x0 = [-1.2, 1.0]")
    
    x0 = [-1.2, 1.0]
    
    # 使用BFGS算法
    result_bfgs = optimize(rosenbrock, x0, BFGS())
    
    println("\nBFGS算法结果：")
    println("  最优解：x* = [", round.(Optim.minimizer(result_bfgs), digits=8), "]")
    println("  最小值：f(x*) = ", round(Optim.minimum(result_bfgs), digits=12))
    println("  迭代次数：", Optim.iterations(result_bfgs))
    println("  收敛状态：", Optim.converged(result_bfgs))
    
    return Optim.minimizer(result_bfgs), Optim.minimum(result_bfgs)
end

# 验证结果
function verify_result(x_opt, f_opt)
    println("\n结果验证：")
    println("理论最优解：x* = [1.0, 1.0]")
    println("理论最小值：f(x*) = 0.0")
    
    if x_opt !== nothing
        error_x = sqrt(sum((x_opt .- [1.0, 1.0]).^2))
        println("解的误差：||x* - [1,1]|| = ", round(error_x, digits=10))
        println("函数值误差：|f(x*) - 0| = ", round(abs(f_opt), digits=12))
    end
end

# 主函数
function main()
    try
        # 使用Optim求解
        x_opt1, f_opt1 = solve_with_optim()
        
        # 验证结果
        verify_result(x_opt1, f_opt1)
        
    catch e
        println("运行出错：", e)
    end
    
    println("\n" * "=" ^ 60)
    println("问题9求解完成")
    println("=" ^ 60)
end

# 运行
main()

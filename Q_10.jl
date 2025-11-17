using JuMP, HiGHS

println("=" ^ 50)
println("问题10：线性规划问题")
println("=" ^ 50)

function solve_linear_programming()
    println("线性规划问题：")
    println("目标函数：min(x1 + 3x2 - 5x3)")
    println("约束条件：")
    println("  x1 - x2 + x3 ≤ 8")
    println("  3x1 + x3 ≤ 4")
    println("  x1, x2, x3 ≥ 0")
    println()
    
    # 创建优化模型
    model = Model(HiGHS.Optimizer)
    set_silent(model)
    
    # 定义变量
    @variable(model, x1 ≥ 0)
    @variable(model, x2 ≥ 0)
    @variable(model, x3 ≥ 0)
    
    # 定义目标函数
    @objective(model, Min, x1 + 3*x2 - 5*x3)
    
    # 定义约束条件
    @constraint(model, con1, x1 - x2 + x3 ≤ 8)
    @constraint(model, con2, 3*x1 + x3 ≤ 4)
    
    # 求解
    optimize!(model)
    
    # 输出结果
    status = termination_status(model)
    println("求解状态：", status)
    
    if status == MOI.OPTIMAL
        println("\n最优解找到！")
        println("最优解：")
        println("  x1 = ", round(value(x1), digits=6))
        println("  x2 = ", round(value(x2), digits=6))
        println("  x3 = ", round(value(x3), digits=6))
        println("  目标函数最优值 = ", round(objective_value(model), digits=6))
        
        # 检查约束条件
        println("\n约束条件检查：")
        println("  约束1 (x1 - x2 + x3 ≤ 8): ", 
                round(value(x1) - value(x2) + value(x3), digits=6), " ≤ 8")
        println("  约束2 (3x1 + x3 ≤ 4): ", 
                round(3*value(x1) + value(x3), digits=6), " ≤ 4")
        
    elseif status == MOI.INFEASIBLE
        println("问题无可行解！")
    elseif status == MOI.DUAL_INFEASIBLE
        println("问题无界（目标函数可以无限小）！")
    else
        println("求解出现问题，状态：", status)
    end
    
    return model
end

# 主函数
function main()
    try
        # 求解线性规划问题
        model = solve_linear_programming()
        
    catch e
        println("运行出错：", e)
    end
    
    println("\n" * "=" ^ 50)
    println("问题10求解完成")
    println("=" ^ 50)
end

# 运行

main()

using JuMP
using Ipopt
using Printf

println("="^60)
println("问题8：最优化问题求解")
println("="^60)

# 问题1：最小化问题
println("\n问题1：最小化问题")
println("minimize: x₁² - 2x₁ + x₂")
println("subject to:")
println("  4x1² + x2² ≤ 4")
println("  x1, x2 ≥ 0")

# 创建优化模型
println("创建问题1的优化模型...")
try
    model1 = Model(Ipopt.Optimizer)
    set_silent(model1)  # 关闭求解器输出

    # 定义变量
    @variable(model1, x1 >= 0)
    @variable(model1, x2 >= 0)

    # 定义目标函数
    @objective(model1, Min, x1^2 - 2*x1 + x2)

    # 定义约束条件
    @constraint(model1, 4*x1^2 + x2^2 <= 4)

    # 求解
    println("正在求解问题1...")
    optimize!(model1)

    # 输出结果
    println("\n求解结果：")
    if termination_status(model1) == MOI.LOCALLY_SOLVED
        println("求解状态：成功")
        @printf("最优值：%.6f\n", objective_value(model1))
        @printf("最优解：x₁ = %.6f, x₂ = %.6f\n", value(x1), value(x2))
        
        # 验证约束
        @printf("约束验证：4*x1^2 + x2^2 = %.6f ≤ 4\n", 4*value(x1)^2 + value(x2)^2)
    else
        println("求解失败：", termination_status(model1))
    end
    
catch e
    println("问题1求解出错: ", e)
end

# 问题2：最大化问题
println("\n" * "="^60)
println("\n问题2：最大化问题")
println("maximize: (x₁ - 1)² - (x₂ - 1)²")
println("subject to:")
println("  x₁ + x₂ + 5 = 0")

try
    # 创建优化模型
    model2 = Model(Ipopt.Optimizer)
    set_silent(model2)

    # 定义变量（无非负约束）
    @variable(model2, x1)
    @variable(model2, x2)

    # 定义目标函数
    @objective(model2, Max, (x1 - 1)^2 - (x2 - 1)^2)

    # 定义约束条件
    @constraint(model2, x1 + x2 + 5 == 0)

    # 求解
    println("正在求解问题2...")
    optimize!(model2)

    # 输出结果
    println("\n求解结果：")
    if termination_status(model2) == MOI.LOCALLY_SOLVED
        println("求解状态：成功")
        @printf("最优值：%.6f\n", objective_value(model2))
        @printf("最优解：x₁ = %.6f, x₂ = %.6f\n", value(x1), value(x2))
        
        # 验证约束
        @printf("约束验证：x₁ + x₂ + 5 = %.6f\n", value(x1) + value(x2) + 5)
    else
        println("求解状态：", termination_status(model2))
        println("问题无界或不可行")
    end
    
catch e
    println("问题2求解出错: ", e)
    println("\n手动分析问题2:")
    
    # 手动分析
    println("约束: x₁ + x₂ + 5 = 0  =>  x₂ = -5 - x₁")
    println("目标函数代入约束:")
    println("f(x₁) = (x₁-1)² - ((-5-x₁)-1)²")
    println("     = (x₁-1)² - (-6-x₁)²")
    println("     = (x₁-1)² - (x₁+6)²")
    
    # 展开计算
    println("\n展开计算:")
    println("f(x₁) = x₁² - 2x₁ + 1 - (x₁² + 12x₁ + 36)")
    println("     = x₁² - 2x₁ + 1 - x₁² - 12x₁ - 36")
    println("     = -14x₁ - 35")
    
    println("\n由于f(x₁) = -14x₁ - 35，且系数为负数")
    println("要使f(x₁)最大，需要x₁尽可能小")
    println("但x₁没有下界限制，所以该问题无上界（unbounded）")
    
    # 给出一些示例点
    println("\n一些可行解示例:")
    for x1_test in [-10, -5, 0, 5, 10]
        x2_test = -5 - x1_test
        obj_val = (x1_test - 1)^2 - (x2_test - 1)^2
        println(@sprintf("x₁ = %3d, x₂ = %3d, f = %8.2f", x1_test, x2_test, obj_val))
    end
end

println("\n" * "="^60)

# 分析和验证
println("\n理论分析：")

println("\n问题2分析：")
println("这是一个带等式约束的优化问题。")
println("约束：x₁ + x₂ = -5，可以用x₂ = -5 - x₁替换")
println("目标函数变为：f(x₁) = (x₁-1)² - (-5-x₁-1)² = (x₁-1)² - (-6-x₁)²")
println("展开：f(x₁) = (x₁-1)² - (x₁+6)² = x₁² - 2x₁ + 1 - x₁² - 12x₁ - 36")
println("简化：f(x₁) = -14x₁ - 35")
println("由于系数为负，要最大化需要x₁尽可能小")
println("但由于没有下界约束，理论上可以趋向-∞")

# 绘制问题1的可行域和等值线（概念性描述）
println("\n几何解释：")
println("问题2：可行域是直线x₁ + x₂ = -5")
println("目标函数(x₁-1)² - (x₂-1)²在此直线上无界")

println("\n求解完成！")

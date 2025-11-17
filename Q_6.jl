using SymPy

# 定义符号变量
@vars x

# 定义函数
f = (x * sin(x)) / exp(2*x)

# 计算导数
f1 = diff(f, x)      # 一阶导数
f2 = diff(f, x, 2)   # 二阶导数

# 显示结果
println("原函数:")
println(f)
println()

println("一阶导数:")
println(simplify(f1))
println()

println("二阶导数:")
println(simplify(f2))
println()

using SymPy

# 定义符号变量
@vars x y

# 第一个积分
f1 = y*sin(x) + x*sin(y)
int1 = integrate(integrate(f1, (x, 3*π, 4*π)), (y, π, 2*π))
println("第一个积分结果:")
println(int1)

# 第二个积分
f2 = x^2 + 7*y^2 + 6
int2 = integrate(integrate(f2, (y, x, x+1)), (x, 0, 1))
println("第二个积分结果:")
println(int2)

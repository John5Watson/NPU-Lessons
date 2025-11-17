using LinearAlgebra

# 设置学号最后一位
a = 9

# 系统1：(-3z + a)/(z³ - 0.2z² - 0.25z + 0.05)
den1 = [1.0, -0.2, -0.25, 0.05]  # z³ - 0.2z² - 0.25z + 0.05
roots1 = Polynomials.roots(Polynomial(reverse(den1)))
stable1 = all(abs.(roots1) .< 1)

# 系统2：(7z² - 0.86z + 0.09)/(z⁴ + 1.7z³ + 1.45z² + 0.124z + 1.6)
den2 = [1.0, 1.7, 1.45, 0.124, 1.6]  # z⁴ + 1.7z³ + 1.45z² + 0.124z + 1.6
roots2 = Polynomials.roots(Polynomial(reverse(den2)))
stable2 = all(abs.(roots2) .< 1)

# 打印结果
println("系统1:")
println("  分母根: ", roots1)
println("  根的模: ", abs.(roots1))
println("  稳定性: ", stable1 ? "稳定" : "不稳定")

println("\n系统2:")
println("  分母根: ", roots2)
println("  根的模: ", abs.(roots2))
println("  稳定性: ", stable2 ? "稳定" : "不稳定")

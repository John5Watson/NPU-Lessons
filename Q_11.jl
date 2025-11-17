using ControlSystems
using Polynomials
using Printf

println("="^50)
println("问题11：传递函数模型分析与转换")
println("="^50)

# 定义传递函数 G(s) = (s² + 5s + 2) / ((s+4)⁴ + 4s + 4)
println("\n1. 定义传递函数 G(s)")
println("G(s) = (s² + 5s + 2) / ((s+4)⁴ + 4s + 4)")

# 分子多项式系数 [s², s¹, s⁰]
num_G = [1, 5, 2]

# 分母多项式：(s+4)⁴ + 4s + 4
# 首先计算 (s+4)⁴
# (s+4)⁴ = s⁴ + 16s³ + 96s² + 256s + 256
# 然后加上 4s + 4
# 所以分母 = s⁴ + 16s³ + 96s² + 260s + 260
den_G = [1, 16, 96, 260, 260]

# 创建传递函数
G = tf(num_G, den_G)
println("\nG(s) = ")
println(G)

# 零极点形式
println("\n2. 零极点形式分析")
zeros_G = tzero(G)
poles_G = pole(G)

println("零点：")
for (i, z) in enumerate(zeros_G)
    if imag(z) ≈ 0
        @printf("z%d = %.4f\n", i, real(z))
    else
        @printf("z%d = %.4f %+.4fi\n", i, real(z), imag(z))
    end
end

println("\n极点：")
for (i, p) in enumerate(poles_G)
    if imag(p) ≈ 0
        @printf("p%d = %.4f\n", i, real(p))
    else
        @printf("p%d = %.4f %+.4fi\n", i, real(p), imag(p))
    end
end

# 状态空间形式
println("\n3. 状态空间形式")
ss_G = ss(G)
println("状态矩阵 A：")
display(ss_G.A)
println("\n输入矩阵 B：")
display(ss_G.B)
println("\n输出矩阵 C：")
display(ss_G.C)
println("\n前馈矩阵 D：")
display(ss_G.D)

println("\n" * "="^50)

# 定义传递函数 H(z) = (z² + 0.568) / ((z-1)(z² - 0.2z + 0.99)) * z⁻⁵
println("\n定义传递函数 H(z)")
println("H(z) = (z² + 0.568) / ((z-1)(z² - 0.2z + 0.99)) * z⁻⁵")
println("T = 0.05s (采样时间)")

# H(z)的分子：z² + 0.568
num_H = [1, 0, 0.568]

# H(z)的分母：(z-1)(z² - 0.2z + 0.99) = z³ - 1.2z² + 1.19z - 0.99
den_H_temp = conv([1, -1], [1, -0.2, 0.99])  # 卷积计算多项式乘法
println("\n分母多项式系数：", den_H_temp)

# 由于有z⁻⁵项，需要在分母添加5个零次项
den_H = [den_H_temp; zeros(5)]  # 添加z⁻⁵的效果

# 创建离散传递函数
T_sample = 0.05
H = tf(num_H, den_H_temp, T_sample)
println("\nH(z) = ")
println(H)

# H(z)的零极点形式
println("\n4. H(z)的零极点形式分析")
zeros_H = tzero(H)
poles_H = pole(H)

println("零点：")
for (i, z) in enumerate(zeros_H)
    if imag(z) ≈ 0
        @printf("z%d = %.4f\n", i, real(z))
    else
        @printf("z%d = %.4f %+.4fi\n", i, real(z), imag(z))
    end
end

println("\n极点：")
for (i, p) in enumerate(poles_H)
    if imag(p) ≈ 0
        @printf("p%d = %.4f\n", i, real(p))
    else
        @printf("p%d = %.4f %+.4fi\n", i, real(p), imag(p))
    end
end

# H(z)的状态空间形式
println("\n5. H(z)的状态空间形式")
ss_H = ss(H)
println("状态矩阵 A：")
display(ss_H.A)
println("\n输入矩阵 B：")
display(ss_H.B)
println("\n输出矩阵 C：")
display(ss_H.C)
println("\n前馈矩阵 D：")
display(ss_H.D)

println("\n分析完成！")

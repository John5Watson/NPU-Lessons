using Polynomials
using TyLegacyNames

# 学号最后一位
a = 9

# 系统1：分母 s³ + 3s² + 2s + a
num1 = [1]
den1 = [1, 3, 2, a]  # 系数从高次到低次
roots1 = Polynomials.roots(Polynomial(reverse(den1)))  # 求根
G1 = tf(num1, den1)
ifstable1 = isstable(G1)

# 系统2：分母 300s⁴ + 500s³ + 20s² + 3s + a
num2 = [3, 1]
den2 = [300, 500, 20, 3, a]
roots2 = Polynomials.roots(Polynomial(reverse(den2)))
G2 = tf(num2, den2)
ifstable2 = isstable(G2)

# 系统3：分母 s⁴ + 3.3s³ + 3.0s² + 1.1s + 0.3a
num3 = [0.2, 0.2]
den3 = [1, 3.3, 3.0, 1.1, 0.3*a]
roots3 = Polynomials.roots(Polynomial(reverse(den3)))
G3 = tf(num3, den3)
ifstable3 = isstable(G3)

# 打印结果
println("系统1特征根: ", roots1)
println("系统1稳定性: ", ifstable1)
println("系统2特征根: ", roots2)
println("系统2稳定性: ", ifstable2)
println("系统3特征根: ", roots3)
println("系统3稳定性: ", ifstable3)

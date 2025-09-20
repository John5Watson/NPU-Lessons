using TyPlot
using TyBase
using TyMath

# 定义分段函数
x1 = range(-3, -1, length=100)    # x <= -1 区间
y1 = -x1.^3                       # y = -x^3

x2 = range(-1, 1, length=100)     # -1 < x < 1 区间
y2 = zeros(length(x2))            # y = 0

x3 = range(1, 3, length=100)      # x >= 1 区间
y3 = 2.0.^x3 .* x3.^2 .+ 1        # y = 2^x * x^2 + 1

# 创建图形
figure(figsize=(8, 6))

# 第一分段 (x >= 1): 绿色点线，标记为+
plot(x3, y3, color="green", linestyle=":", linewidth=1, 
     marker="+", markersize=4, label="y = 2^x x² + 1 (x ≥ 1)")
hold("on");

# 第二分段 (-1 < x < 1): 蓝色虚线，标记为*
plot(x2, y2, color="blue", linestyle="--", linewidth=1, 
     marker="*", markersize=4, label="y = 0 (-1 < x < 1)")

# 第三分段 (x <= -1): 红色点划线，标记为o
plot(x1, y1, color="red", linestyle="-.", linewidth=1, 
     marker="o", markersize=4, label="y = -x³ (x ≤ -1)")

# 图形美化
grid(true)
xlabel("x")
ylabel("y")
title("分段函数图像")
legend(loc="upper right")
grid(linewidth=1, color="lightgray")

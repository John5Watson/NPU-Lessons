# 定义算子
s = tf("s")
# 定义学号最后一位
id = 9

# 定义系统小框
G1 = 2 + id
G2 = 1/(s+1)
G3 = s/(s^2+2)
G4 = 1/(s^2)
H1 = 10 + id
H2 = (s^2+2)/(s^3+14)
H3 = (4*s+2)/(s+1)^2

# 求取局部回路
G11 = feedback(G2*G3, H2)
G12 = feedback(G4, H1)
G21 = feedback(G11*G12, H3)

# 求取全系统
GG = G1*G21

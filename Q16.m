clear all; close all; clc;

%% 参数设置
last_digit = 9;

% 定义连续系统传递函数 G(s)
num_s = [-2, 3, -last_digit];  % 分子: -2s^2 + 3s - 学号最后一位
den_s = [1, 3.2, 1.61, 3.03]; % 分母: s^3 + 3.2s^2 + 1.61s + 3.03

% 创建连续传递函数
G_s = tf(num_s, den_s);

fprintf('连续系统传递函数 G(s):\n');
G_s

%% 不同采样周期的离散化
T_values = [0.01, 0.1, 1];  % 三种不同的采样周期

% 存储离散化结果
G_z = cell(length(T_values), 1);

fprintf('\n=== 使用不同采样周期进行离散化 ===\n');

for i = 1:length(T_values)
    T = T_values(i);
    
    % 使用零阶保持器(ZOH)进行离散化
    G_z{i} = c2d(G_s, T, 'zoh');
    
    fprintf('\n采样周期 T = %.2f 时的离散传递函数 G(z):\n', T);
    G_z{i}
end

%% 绘制单位阶跃响应曲线
figure('Position', [100, 100, 1200, 800]);

% 时间向量设置
t_continuous = 0:0.001:100;  % 连续时间
t_discrete = cell(length(T_values), 1);

% 计算连续系统的单位阶跃响应
[y_continuous, t_cont] = step(G_s, t_continuous);

% 绘制连续系统响应
subplot(2, 2, 1);
plot(t_cont, y_continuous, 'b-', 'LineWidth', 2);
grid on;
title('连续系统G(s)的单位阶跃响应');
xlabel('时间 (s)');
ylabel('输出');
legend('G(s)', 'Location', 'best');

% 绘制不同采样周期的离散系统响应
colors = {'r-o', 'g-s', 'm-^'};
line_styles = {'-', '--', ':'};

for i = 1:length(T_values)
    T = T_values(i);
    
    % 离散时间向量
    t_discrete{i} = 0:T:100;
    
    % 计算离散系统的单位阶跃响应
    [y_discrete, t_disc] = step(G_z{i}, t_discrete{i});
    
    % 绘制单独的离散响应
    subplot(2, 2, i+1);
    plot(t_cont, y_continuous, 'b-', 'LineWidth', 1.5); hold on;
    plot(t_disc, y_discrete, colors{i}, 'LineWidth', 1, 'MarkerSize', 2);
    grid on;
    title(sprintf('T = %.2f s 时的比较', T));
    xlabel('时间 (s)');
    ylabel('输出');
    legend('连续G(s)', sprintf('离散G(z), T=%.2f', T), 'Location', 'best');
    hold off;
end

% 调整子图布局
sgtitle('连续系统与离散系统的单位阶跃响应比较');

%% 绘制所有系统在同一图中的比较
figure('Position', [200, 200, 1000, 600]);

% 绘制连续系统
plot(t_cont, y_continuous, 'b-', 'LineWidth', 3);
hold on;

% 绘制所有离散系统
for i = 1:length(T_values)
    T = T_values(i);
    t_discrete{i} = 0:T:100;
    [y_discrete, t_disc] = step(G_z{i}, t_discrete{i});
    
    plot(t_disc, y_discrete, colors{i}, 'LineWidth', 1, 'MarkerSize', 2);
end

grid on;
title('连续系统与不同采样周期离散系统的单位阶跃响应比较');
xlabel('时间 (s)');
ylabel('输出');
legend('连续G(s)', 'T=0.01s', 'T=0.1s', 'T=1s', 'Location', 'best');
hold off;

fprintf('\n程序执行完成！\n');
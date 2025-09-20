clear all; close all; clc;

% 公共设置
set(0, 'DefaultLineLineWidth', 1.5);
set(0, 'DefaultAxesFontSize', 10);
set(0, 'DefaultTextFontSize', 10);

%% 系统1: G(s) = 10(s+a)/[s^2(s+15)(s^2+8s+10)]
figure('Name', 'System 1 Analysis', 'Position', [100, 100, 1200, 800]);

% 定义传递函数
last_digit = 9;
num1 = 10 * [1, last_digit];
den1 = conv([1, 15], [1, 8, 10]);
den1 = conv([1, 0, 0], den1);
G1 = tf(num1, den1);

% 创建单位负反馈闭环系统
sys_cl1 = feedback(G1, 1);

% Bode图
subplot(2,2,1);
[mag, phase, w] = bode(G1);
margin(G1);
grid on;
title('System 1: Bode Plot');
% 获取裕度值
[Gm1, Pm1, Wcg1, Wcp1] = margin(G1);
% 添加裕度文本标注
text(0.01, -100, {sprintf('Gain Margin: %.2f dB', 20*log10(Gm1)), ...
                 sprintf('Phase Margin: %.2f°', Pm1)}, ...
     'VerticalAlignment', 'bottom', 'FontSize', 10, 'BackgroundColor', 'w');

% Nyquist图
subplot(2,2,2);
[re, im] = nyquist(G1);
nyquist(G1);
axis([-0.5, 0.5, -0.5, 0.5]); % 调整坐标范围
hold on;
% 标记(-1,0)点
plot(-1, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(-1.05, 0.05, '(-1,0)', 'FontSize', 10);
% 添加裕度信息
text(-0.45, 0.4, {sprintf('GM: %.2f dB', 20*log10(Gm1)), ...
                 sprintf('PM: %.2f°', Pm1)}, ...
     'FontSize', 10, 'BackgroundColor', 'w');
title('System 1: Nyquist Plot');
grid on;

% Nichols图
subplot(2,2,3);
nichols(G1);
ngrid;
title('System 1: Nichols Chart');

% 阶跃响应
subplot(2,2,4);
[y, t] = step(sys_cl1);
step(sys_cl1);
title('System 1: Step Response');
grid on;
% 计算阶跃响应指标
stepinfo1 = stepinfo(sys_cl1);
overshoot1 = stepinfo1.Overshoot;
settling_time1 = stepinfo1.SettlingTime;
% 添加指标文本
text(0.6*max(t), 0.6*max(y), ...
    {sprintf('Overshoot: %.2f%%', overshoot1), ...
     sprintf('Settling Time: %.2f s', settling_time1)}, ...
    'FontSize', 10, 'BackgroundColor', 'w');

fprintf('System 1:\n');
fprintf('Gain Margin: %.2f dB at %.2f rad/s\n', 20*log10(Gm1), Wcg1);
fprintf('Phase Margin: %.2f° at %.2f rad/s\n', Pm1, Wcp1);

%% 系统2: G(s) = 2(s/3+a)/[s(0.02s+1)(0.03s+1)(0.1s+1)]
figure('Name', 'System 2 Analysis', 'Position', [100, 100, 1200, 800]);

% 定义传递函数
num2 = 2 * [1/3, last_digit];
den2 = conv([1, 0], conv([0.02, 1], conv([0.03, 1], [0.1, 1])));
G2 = tf(num2, den2);

% 创建单位负反馈闭环系统
sys_cl2 = feedback(G2, 1);

% Bode图
subplot(2,2,1);
margin(G2);
grid on;
title('System 2: Bode Plot');
% 获取裕度值
[Gm2, Pm2, Wcg2, Wcp2] = margin(G2);
% 添加裕度文本标注
text(0.01, -100, {sprintf('Gain Margin: %.2f dB', 20*log10(Gm2)), ...
                 sprintf('Phase Margin: %.2f°', Pm2)}, ...
     'VerticalAlignment', 'bottom', 'FontSize', 10, 'BackgroundColor', 'w');

% Nyquist图
subplot(2,2,2);
[re, im] = nyquist(G2);
nyquist(G2);
axis([-5, 1, -3, 3]); % 调整坐标范围
hold on;
plot(-1, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(-1.1, 0.1, '(-1,0)', 'FontSize', 10);
% 添加裕度信息
text(-4.5, 2.5, {sprintf('GM: %.2f dB', 20*log10(Gm2)), ...
                sprintf('PM: %.2f°', Pm2)}, ...
     'FontSize', 10, 'BackgroundColor', 'w');
title('System 2: Nyquist Plot');
grid on;

% Nichols图
subplot(2,2,3);
nichols(G2);
ngrid;
title('System 2: Nichols Chart');

% 阶跃响应
subplot(2,2,4);
[y, t] = step(sys_cl2);
step(sys_cl2);
title('System 2: Step Response');
grid on;
% 计算阶跃响应指标
stepinfo2 = stepinfo(sys_cl2);
overshoot2 = stepinfo2.Overshoot;
settling_time2 = stepinfo2.SettlingTime;
% 添加指标文本
text(0.6*max(t), 0.6*max(y), ...
    {sprintf('Overshoot: %.2f%%', overshoot2), ...
     sprintf('Settling Time: %.2f s', settling_time2)}, ...
    'FontSize', 10, 'BackgroundColor', 'w');

fprintf('\nSystem 2:\n');
fprintf('Gain Margin: %.2f dB at %.2f rad/s\n', 20*log10(Gm2), Wcg2);
fprintf('Phase Margin: %.2f° at %.2f rad/s\n', Pm2, Wcp2);

%% 系统3: 状态空间模型
figure('Name', 'System 3 Analysis', 'Position', [100, 100, 1200, 800]);

% 定义状态空间矩阵
A = [0, 2, 1; -3, -2, 0; 1, 3, 4];
B = [4; 3; 2];
C = [1, 2, 3];
D = 0;
G3 = ss(A, B, C, D);

% 转换为传递函数并简化
G3_tf = minreal(tf(G3));

% 创建单位负反馈闭环系统
sys_cl3 = feedback(G3_tf, 1);

% Bode图
subplot(2,2,1);
margin(G3_tf);
grid on;
title('System 3: Bode Plot');
% 获取裕度值
[Gm3, Pm3, Wcg3, Wcp3] = margin(G3_tf);
% 添加裕度文本标注
text(0.01, -100, {sprintf('Gain Margin: %.2f dB', 20*log10(Gm3)), ...
                 sprintf('Phase Margin: %.2f°', Pm3)}, ...
     'VerticalAlignment', 'bottom', 'FontSize', 10, 'BackgroundColor', 'w');

% Nyquist图
subplot(2,2,2);
[re, im] = nyquist(G3_tf);
nyquist(G3_tf);
axis([-2, 1, -1.5, 1.5]); % 调整坐标范围
hold on;
plot(-1, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(-1.1, 0.1, '(-1,0)', 'FontSize', 10);
% 添加裕度信息
text(-1.8, 1.2, {sprintf('GM: %.2f dB', 20*log10(Gm3)), ...
                sprintf('PM: %.2f°', Pm3)}, ...
     'FontSize', 10, 'BackgroundColor', 'w');
title('System 3: Nyquist Plot');
grid on;

% Nichols图
subplot(2,2,3);
nichols(G3_tf);
ngrid;
title('System 3: Nichols Chart');

% 阶跃响应
subplot(2,2,4);
[y, t] = step(sys_cl3);
step(sys_cl3);
title('System 3: Step Response');
grid on;
% 计算阶跃响应指标
stepinfo3 = stepinfo(sys_cl3);
overshoot3 = stepinfo3.Overshoot;
settling_time3 = stepinfo3.SettlingTime;
% 添加指标文本
text(0.6*max(t), 0.6*max(y), ...
    {sprintf('Overshoot: %.2f%%', overshoot3), ...
     sprintf('Settling Time: %.2f s', settling_time3)}, ...
    'FontSize', 10, 'BackgroundColor', 'w');

fprintf('\nSystem 3:\n');
fprintf('Gain Margin: %.2f dB at %.2f rad/s\n', 20*log10(Gm3), Wcg3);
fprintf('Phase Margin: %.2f° at %.2f rad/s\n', Pm3, Wcp3);
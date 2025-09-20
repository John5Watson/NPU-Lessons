% 读取CSV文件并绘制XY坐标图

% 清除工作空间和命令窗口
clear;
clc;
close all;

% 读取CSV文件
try
    % 从根目录读取X数据的完整矩阵
    X_data_full = readmatrix('X_data.csv');
    fprintf('成功读取 X_data.csv，原始数据维度：%d x %d\n', size(X_data_full));
    
    % 从根目录读取Y数据的完整矩阵
    Y_data_full = readmatrix('Y_data.csv');
    fprintf('成功读取 Y_data.csv，原始数据维度：%d x %d\n', size(Y_data_full));
    
    % 提取第二列数据
    if size(X_data_full, 2) >= 2
        X_column2 = X_data_full(:, 2);
    else
        fprintf('警告：X_data.csv 没有第二列，使用第一列数据\n');
        X_column2 = X_data_full(:, 1);
    end
    
    if size(Y_data_full, 2) >= 2
        Y_column2 = Y_data_full(:, 2);
    else
        fprintf('警告：Y_data.csv 没有第二列，使用第一列数据\n');
        Y_column2 = Y_data_full(:, 1);
    end
    
    % 隔行读取（取奇数行：1,3,5,7...）
    odd_indices = 1:2:length(X_column2);
    X_data = X_column2(odd_indices);
    
    odd_indices_y = 1:2:length(Y_column2);
    Y_data = Y_column2(odd_indices_y);
    
    fprintf('提取第二列并隔行读取后 - X数据长度：%d，Y数据长度：%d\n', length(X_data), length(Y_data));
    
catch ME
    fprintf('读取文件时出错：%s\n', ME.message);
    return;
end

% 检查数据维度是否匹配
if length(X_data) ~= length(Y_data)
    fprintf('警告：X和Y数据长度不匹配！\n');
    fprintf('X数据长度：%d，Y数据长度：%d\n', length(X_data), length(Y_data));
    
    % 取较短的长度
    min_length = min(length(X_data), length(Y_data));
    X_data = X_data(1:min_length);
    Y_data = Y_data(1:min_length);
    fprintf('已调整为相同长度：%d\n', min_length);
end

% 绘制XY坐标图
figure('Position', [100, 100, 800, 600]);

% 添加连线图
plot(X_data, Y_data, 'b-', 'LineWidth', 2);
grid on;
xlabel('X坐标');
ylabel('Y坐标');
title('飞行剖面图');
axis equal;

% 显示数据统计信息
fprintf('\n=== 数据统计信息 ===\n');
fprintf('原始数据：从CSV文件第二列隔行提取\n');
fprintf('提取后数据点总数：%d\n', length(X_data));
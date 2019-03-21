%{
@author: Liang Hanpu
@date: 2019/3/21

@description1: �趨������Ԫ������ͼ
    �������a1, a2, a3; alpha, beta, gamma
    ��ԭ������
@description2: �趨������С����ͼ
@description3: ��Ϊ�Ѷ�ԭ��, ֻ��beta=gamma=pi/2
@description4: һ������£�������������������ݿ��
    ���������������������ڼ������Ļ��������ԭ�ӵ�
@description5: ��������ԭ�Ӵ�С����ɫ
%}

clc, clear, close all
%% ��������
global cell_size a1 a2 a3 alpha beta gamma
% ������
a = [1, 1, 1];
% �����Ƕ�
angle = [pi/2, pi/2, pi/2];
% ������С
cell_size = [2, 2, 2];
% ������
position1 = [0, 0, 0; ...
           1, 1, 0; ...
           1, 0, 0; ...
           0, 1, 0; ...
           0, 0, 1; ...
           1, 1, 1; ...
           1, 0, 1; ...
           0, 1, 1];
% ����
position2 = [0.5, 0.5, 0.5];
% ����
position3 = [0, 0.5, 0.5; ...
             0.5, 0, 0.5; ...
             0.5, 0.5, 0; ...
             1, 0.5, 0.5; ...
             0.5, 1, 0.5; ...
             0.5, 0.5, 1];

[a1, a2, a3] = deal(a(1), a(2), a(3));
[alpha, beta, gamma] = deal(angle(1), angle(2), angle(3));
%% ��ͼ
figure
% ��ͼ����
hold on, axis equal
axis image off
view(-37.5, 30)

% ���������
plotBox();
% ������ԭ��
plotAtoms(position2, [244, 13, 100]/255, 40);
plotAtoms(position1, [29, 191, 151]/255, 50);   %��������һ��Ҫ���������
title('Made by Liang Hanpu')

%% ������
function plotBox()
% ���߿�
    global a1 a2 a3 alpha beta gamma cell_size 
    % �����ı߳�
    [A1, A2, A3] = deal(a1*cell_size(1), a2*cell_size(2), a3*cell_size(3));
    % 8������
    vertex = [0, 0, 0;...
              A1, 0, 0;...
              A2*cos(alpha), A2*sin(alpha), 0;...
              A2*cos(alpha)+A1, A2*sin(alpha), 0;...
              0, 0, A3;...
              A1, 0, A3;...
              A2*cos(alpha), A2*sin(alpha), A3;...
              A2*cos(alpha)+A1, A2*sin(alpha), A3];
    % 12����
    plotLine(vertex(1,:), vertex(2,:))
    plotLine(vertex(1,:), vertex(3,:))
    plotLine(vertex(2,:), vertex(4,:))
    plotLine(vertex(3,:), vertex(4,:))
    plotLine(vertex(5,:), vertex(6,:))
    plotLine(vertex(5,:), vertex(7,:))
    plotLine(vertex(6,:), vertex(8,:))
    plotLine(vertex(7,:), vertex(8,:))
    plotLine(vertex(1,:), vertex(5,:))
    plotLine(vertex(2,:), vertex(6,:))
    plotLine(vertex(3,:), vertex(7,:))
    plotLine(vertex(4,:), vertex(8,:))
end

function plotAtoms(position, markercolor, markersize)
% ����ԭ��ͼ��
    global cell_size a1 a2 a3 alpha beta gamma
    % ԭʼ����
    % plot3(position(:,1), position(:,2), position(:,3), 'ok', 'linewidth', 1.5, 'markersize', 50, 'markerfacecolor', [29,191,151]/255)
    % ����
    % �����õ���������ԭ��
    cur_point = position;
    for i1 = 1:cell_size(1)
        for i2=1:cell_size(2)
            for i3=1:cell_size(3)
                x_plus = a1*(i1-1) + a2*cos(alpha)*(i1-1);
                y_plus = a2*sin(alpha)*(i2-1);
                z_plus = a3*(i3-1);
                cur_point = [cur_point; [position(:,1)+x_plus position(:,2)+y_plus position(:,3)+z_plus]];
            end
        end
    end
    plot3(cur_point(:,1), cur_point(:,2), cur_point(:,3), 'ok', 'linewidth', 1.5, 'markersize', markersize, 'markerfacecolor', markercolor)
    % �����������С
    [x_min, x_max, y_min, y_max, z_min, z_max] = deal(min(cur_point(:,1)), max(cur_point(:,1)), ...
                                                      min(cur_point(:,2)), max(cur_point(:,2)), ...
                                                      min(cur_point(:,3)), max(cur_point(:,3)));
    x_len = (x_max - x_min)/6;
    y_len = (y_max - y_min)/6;
    z_len = (z_max - z_min)/6;
    axis([x_min-x_len x_max+x_len y_min-y_len y_max+y_len z_min-z_len z_max+z_len])
end

function plotLine(x1, x2)
% ��������֮��Ŀ����
    plot3([x1(1) x2(1)], [x1(2), x2(2)], [x1(3), x2(3)], 'k', 'linewidth', 1.3)
end
    
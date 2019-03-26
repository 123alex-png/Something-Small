%{
@author: Liang Hanpu
@date: 2019/3/25
@description: ���������ڼ���һЩ�򵥾���Ĳ���Ԩ������ͼ��
              Ŀǰ����**δ���״̬**��ֻ�ǿ�����ռ��λ�������һ�Ҫ���ⶫ����
%}

clc, clear, close all

% ������
a = 2;
% ��ʸ
a1 = a/2*[0, 1, 1];
a2 = a/2*[1, 0, 1];
a3 = a/2*[1, 1, 0];

[b1, b2, b3] = reciprocalLattice(a1, a2,a3);

%% ��ͼ
% ��������
figure
axis equal
hold on
grid on
view(-37.5, 30)
xlabel('x')
ylabel('y')
zlabel('z')

% ��ʸʸ��
plotVector(b1, b2, b3)
% ����Ԩ���߽�
% ����Ӧ�ÿ��Բ������п����������ñ���һ��
plotFace(b1)
plotFace(-b1)
plotFace(b2)
plotFace(-b2)
plotFace(b3)
plotFace(-b3)


function plotVector(b1, b2, b3)
    plot3([0 b1(1)], [0 b1(2)], [0 b1(3)])
    plot3([0 b2(1)], [0 b2(2)], [0 b2(3)])
    plot3([0 b3(1)], [0 b3(2)], [0 b3(3)])
end

function plotFace(b)
% ������ķ��̲�����ͼ
%   ����ж���Ĵ�С����
    % ����������д�����Ƿ��ֲ���
    
%     rho = sqrt(sum(b.^2));
%     theta0 = acos(b(3)/rho);
%     phi0 = atan(b(2)/b(1));
%     theta = linspace(theta0-0.5, theta0+0.5, 10);
%     phi = linspace(phi0*5/10, phi0*15/10, 10);
%     
%     [T, P] = meshgrid(theta, phi);
%     
%     x = rho*sin(T).*cos(P);
%     y = rho*sin(T).*sin(P);
    
    % ����ֱ������ϵд�����ǲ��ÿ��ƴ�С
    [x, y] = meshgrid(linspace(-5, 5, 10));
    % z = rho*cos(T);
    z = -1/b(3)*(b(1)*x + b(2)*y - b(1)^2-b(2)^2)+b(3);
    mesh(x, y, z)
end




function [b1, b2, b3] = reciprocalLattice(a1, a2, a3)
% �����ʸתΪ������ʸ��
    V = a1*cross(a2, a3)';
    b1 = 2*pi*cross(a2, a3)/V;
    b2 = 2*pi*cross(a3, a1)/V;
    b3 = 2*pi*cross(a1, a2)/V;
end
    
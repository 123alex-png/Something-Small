clc, clear, close all


figure(1)
%��������
plot3([0 0], [0 0], [0 2], 'k', 'LineWidth', 2)
axis([-2 2 0 2 -2 2])
hold on
grid on
plot3([0 2], [0 0], [0 0], 'k', 'LineWidth', 2)
plot3([0 0], [0 2], [0 0], 'k', 'LineWidth', 2)
xlabel('x')
ylabel('y')
zlabel('z')
%����ת��
y_ = 0:0.1:2;
z_ = y_-1;
x_ = zeros(size(y_));
plot3(x_, y_, z_)

%��ʼ����������
x = 0:0.1:1;
y = 0:0.1:1;
[X, Y] = meshgrid(x, y);
Z = X+Y;

%��ԭλ������
surf(X, Y, Z)

%����һ��ƽ��
[X1, Y1, Z1] = Move(2, -1, X, Y, Z);
%����������ת
[X2, Y2, Z2] = Rotate(1, pi/4, X1, Y1, Z1);
[X3, Y3, Z3] = Rotate(2, pi, X2, Y2, Z2);
[X4, Y4, Z4] = Rotate(1, -pi/4, X3, Y3, Z3);
[X5, Y5, Z5] = Move(2, 1, X4, Y4, Z4);

%����ת�������
surf(X5, Y5, Z5)
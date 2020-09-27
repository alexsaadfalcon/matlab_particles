function [] = draw_frame()
% Draw a single frame given global position vectors

global x;
global y;
num = length(x);
x = mod(x,50);
y = mod(y,50);
x1 = x(1:round(num/4));
x2 = x(round(num/4)+1:round(2*num/4));
x3 = x(round(2*num/4)+1:round(3*num/4));
x4 = x(round(3*num/4)+1:num);
y1 = y(1:round(num/4));
y2 = y(round(num/4)+1:round(2*num/4));
y3 = y(round(2*num/4)+1:round(3*num/4));
y4 = y(round(3*num/4)+1:num);
plot(x1,y1,'*m');
hold on; %turns hold on here so all four colors are plotted, but the previous frame doesn't stay
plot(x2,y2,'*r');
plot(x3,y3,'*y');
plot(x4,y4,'*b');
axis([0 50 0 50]);
set(gca, 'visible', 'off');
hold off;
pause(.025); %40 frames per second (ideally)

end


function [] = particles5(flag1,flag2,flag3,flag4,flag5) %5 flags = whirlpool
                         %1x2 vector of flag1 coordinates
                               %1x2 vector of flag2 coordinates
                                     %1x2 vector of flag3 coordinates
                                           %1x2 vector of flag4 coordinates   
                                                 %1x2 vector of flag5
                                                 %coordinates
global x;
global y;
global vx;
global vy;
global keepGoing;
global speed;

keepGoing = true;
center = (flag1 + flag2 + flag3 + flag4 + flag5) / 5;
num = length(x);
flags = [flag1;flag2;flag3;flag4;flag5];
path = ceil(5*rand(1,num));
while keepGoing
    draw_frame();

    x = x + vx/2; %changes position coordinates by velocity
    y = y + vy/2;
    
    xDist = -(x - flags(path,1)');
    yDist = -(y - flags(path,2)');
    dist = sqrt(xDist.^2 + yDist.^2) + 2*rand(1,num) - 1;
    vx = vx + xDist./dist;
    vy = vy + yDist./dist;
    vx = vx + (rand(size(vx)) - .5)/2;
    vy = vy + (rand(size(vy)) - .5)/2;

    path(dist<4) = path(dist<4) + 1;
    path(path == 6) = 1;
    
    mag = sqrt(vx.^2 + vy.^2); %finds magnitude of velocity vectors
    newmag = mag - (mag - 2*speed); %brings magnitude of velocities to speed/4
    vx = vx./mag.*newmag; %sets new velocities according to newmag and direction
    vy = vy./mag.*newmag;
end
function [] = particles4(flag1) %4 flags = whirlpool
                         %1x2 vector of flag1 coordinates
                               %1x2 vector of flag2 coordinates
                                     %1x2 vector of flag3 coordinates
                                           %1x2 vector of flag4 coordinates                               
global x;
global y;
global vx;
global vy;
global keepGoing;
global speed;

keepGoing = true;
center = flag1;
num = length(x);
correctDist = linspace(1,25,num); %correct positions of particles in center of the whirlpool
limits = [0, 50];
while keepGoing
    draw_frame();

    x = x + vx/2; %changes position coordinates by velocity
    y = y + vy/2;
            
    xdist = x - center(1); %coordinates distances from center of whirlpool
    ydist = y - center(2); 
    dist2 = xdist.^2 + ydist.^2; 
    dist = sqrt(dist2);
    inCenter = dist<2.1;
    for i = 1:num
        if inCenter(i)
            new1 = limits(round(rand(1, 1)+1));
            new2 = rand(1,1)*50;
            if rand(1, 1) < .5
                x(i) = new1;
                y(i) = new2;
            else
                x(i) = new2;
                y(i) = new1;
            end
            vx(i) = rand() - .5;
            vy(i) = rand() - .5;
        end
    end   
    
%     vx = vx + speed * (1./dist) .* cos(th);
%     vy = vy + speed * (1./dist) .* sin(th);
    vx = vx - 4*speed * ydist ./ dist;
    vy = vy + 4*speed * xdist ./ dist;
    vx = vx-xdist./dist2-speed*sign(xdist)*2; 
    vy = vy-ydist./dist2-speed*sign(ydist)*2; 

    vx = vx + 2*(rand(size(vx)) - .5);
    vy = vy + 2*(rand(size(vy)) - .5);
    
    mag = sqrt(vx.^2 + vy.^2); %finds magnitude of velocity vectors
    newmag = mag - ((mag - speed/4)/1.5); %brings magnitude of velocities to speed/4
    vx = vx./mag.*newmag; %sets new velocities according to newmag and direction
    vy = vy./mag.*newmag;
end
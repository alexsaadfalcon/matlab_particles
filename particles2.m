function [] = particles2(flag1) %2 flag = vortex between flags
                         %1x2 vector of flag1 coordinates
                              %1x2 vector of flag2 coordinates
global x;
global y;
global vx;
global vy;
global keepGoing; 
global speed;

keepGoing = true;
center = flag1;
num = length(x);
while keepGoing
    draw_frame();

    x = x + vx/2; %changes position coordinates by velocity
    y = y + vy/2;
    
    xleft = x<0; %coordinates off the grid to the left
    xright = x>50; %coordinates off the grid to the right
    ydown = y<0; %under
    yup = y>50; %over
    
    x(xleft) = x(xleft) + 50;
    x(xright) = x(xright) - 50;
    y(ydown) = y(ydown) + 50;
    y(yup) = y(yup) - 50;
        
    xdist = x - center(1); %coordinates distances from vortex
    ydist = y - center(2); 
    dist = sqrt(xdist.^2 + ydist.^2);
    
    th = zeros(1,length(x));
    for i = 1:length(xdist) %goes through all coordinates and determines new velocities
        if xdist(i) < 0 %gets the correct current angle of their velocities
            th(i) = atan(ydist(i)./xdist(i)) + pi; 
        else
            th(i) = atan(ydist(i)./xdist(i));
        end
    end
    
    vx = -(7./(1+dist)).*cos(th) + vx; %increases velocity of inbound coordinates
    vy = -(7./(1+dist)).*sin(th) + vy; %by a value inversely proportional to distance from source
    vx = vx + (rand(size(vx)) - .5)/2;
    vy = vy + (rand(size(vy)) - .5)/2;
    
    
    mag = sqrt(vx.^2 + vy.^2); %finds magnitude of velocity vectors
    newmag = mag - ((mag - speed)/1.5); %brings magnitude of velocities to speed
    vx = vx./mag.*newmag; %sets new velocities according to newmag and direction
    vy = vy./mag.*newmag;
end
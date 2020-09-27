function [] = particles1(flag1) %1 flag = source and push at flag1
                         %1x2 vector of flag1 coordinates
global x;
global y;
global vx;
global vy;
global keepGoing;
global speed;

keepGoing = true;
while keepGoing %spawn function
    draw_frame();

    x = x + vx/2; %changes position coordinates by velocity
    y = y + vy/2;
    
    xout = x>50 | x<0; %mask of x coordinates out of bounds
    yout = y>50 | y<0; %mask of y coordinates out of bounds
    
    x(xout) = flag1(1) + rand(1,1) - .5; %coordinates outside bounds go to middle
    y(yout) = flag1(2) + rand(1,1) - .5;
    
    vx(xout) = 0;
    vy(yout) = 0;
    
    xdist = x - flag1(1); %coordinates distances from spawn
    ydist = y - flag1(2);
    dist = sqrt(xdist.^2 + ydist.^2);
    
    th = zeros(1,length(x));
    for i = 1:length(xdist) %goes through all coordinates and determines new velocities
        if xdist(i) < 0 %gets the correct current angle of their velocities
            th(i) = atan(ydist(i)./xdist(i)) + pi; 
        else
            th(i) = atan(ydist(i)./xdist(i));
        end
    end
    
    vx = (3./(1+dist)).*cos(th) + vx; %increases velocity of inbound coordinates
    vy = (3./(1+dist)).*sin(th) + vy; %by a value inversely proportional to distance from source
    vx = vx + (rand(size(vx)) - .5)/2;
    vy = vy + (rand(size(vy)) - .5)/2;
    % mean(vx)
    % mean(vy)
    
    mag = sqrt(vx.^2 + vy.^2); %finds magnitude of velocity vectors
    newmag = mag - ((mag - speed)/1.5); %brings magnitude of velocities to speed
    vx = vx./mag.*newmag; %sets new velocities according to newmag and direction
    vy = vy./mag.*newmag;
end
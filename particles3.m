function [] = particles3(flag1,flag2,flag3) %3 flag = 3 sources and vortex
                         %1x2 vector of flag1 coordinates
                               %1x2 vector of flag2 coordinates
                                     %1x2 vector of flag3 coordinates
                                    
global x;
global y;
global vx;
global vy;
global keepGoing;
global speed;

keepGoing = true;
center = (flag1 + flag2 + flag3) / 3;
flags = [flag1;flag2;flag3]; %puts all 3 flags in a column for easier access later
num = length(x);
while keepGoing
    draw_frame();

    x = x + vx/2; %changes position coordinates by velocity
    y = y + vy/2;
            
    xdist = x - center(1); %coordinates distances from vortex
    ydist = y - center(2); 
    dist = sqrt(xdist.^2 + ydist.^2);
    inCenter = dist<1.4;
    for i = 1:num
        if inCenter(i) 
            k = ceil(3*rand()); %generates random integer from 1 to 3
            x(i) = flags(k,1) + 2*rand() - 1;
            y(i) = flags(k,2) + 2*rand() - 1;
            vx(i) = rand() - .5;
            vy(i) = rand() - .5;
        end
    end       
    
    xdist = x - center(1); %coordinates distances from vortex
    ydist = y - center(2); 
    dist = sqrt(xdist.^2 + ydist.^2); %resets distances so it doesn't use previous distances for center coordinates
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
function particles0() %0 flags = random motion of particles

global x;
global y;
global vx;
global vy;
global keepGoing;
global speed;

num = 5000;

if isempty(speed)
    speed = 0.85;
end                                            
                         %x and y should both be all zeros if the beginning
                         %of simulation

if isempty(x) %this should only occur if it is the very start
    x = 50*rand(1,num); %initialization of particle positions randomly
    y = 50*rand(1,num);
    vx = 2*rand(1,num)-1; %initialization of particle velocities randomly
    vy = 2*rand(1,num)-1; %movement works by adding velocity to position each frame
    for i = 1:length(x)
        mag = sqrt(vx(i)^2 + vy(i)^2);
        vx(i) = vx(i) / mag; %makes sure the magnitude of each velocity is 1
        vy(i) = vy(i) / mag;
    end
    axis([0 50 0 50]); %sets default axes
    hold off;
end

keepGoing = true;
while keepGoing
    draw_frame();

    x = x + vx/2; %changes position coordinates by velocity
    y = y + vy/2;
    
    th = zeros(1,length(x));
    for i = 1:length(x) %goes through all coordinates and determines new velocities
        if vx(i) < 0 %gets the correct current angle of their velocities
            th(i) = atan(vy(i)./vx(i)) + pi; 
        else
            th(i) = atan(vy(i)./vx(i));
        end
    end
    mag = sqrt(vx.^2 + vy.^2); %finds magnitude of velocity vectors
    newth = th + rand(1,length(th)) - .5;
    newmag = mag - ((mag - speed) ./ 1.5); %brings magnitude of velocities to speed/2
    vx = newmag.*cos(newth); %sets new velocities according to newmag and direction
    vy = newmag.*sin(newth);
end

end
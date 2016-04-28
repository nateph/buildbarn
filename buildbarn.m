function buildbarn()

P = reppentagon();
X = repsquare();

%grass
grass = translate([-.5;-.5;0]) * scale([2;3;1]) * X;
drawshape(grass,[0,0.7,0])
grid on
axis([-0.5 1.5 -0.5 2.5 0 2]);
xlabel('x');
ylabel('y');
zlabel('z');

%base barn structure
barnwall1 = rotate(pi/2, 1) * scale([1;1;1]) * P;
drawshape(barnwall1,[0.85, 0.2, 0])

barnwall2 = rotate(-pi/2, 2) * scale([1;2;1]) * X;
drawshape(barnwall2,[0.85, 0.2, 0])

barnwall3 = translate([1,0,0]) * rotate(-pi/2, 2) * scale([1;2;1]) * X;
drawshape(barnwall3,[0.85, 0.2, 0])

barnwall4 = translate([0,2,0]) * rotate(pi/2, 1) * scale([1;1;1]) * P;
drawshape(barnwall4,[0.85, 0.2, 0])

%two barn roofs
roof1 = translate([-0.05,-0.1,0.96]) * rotate(-pi/4,2) * scale([0.78;2.2;0]) * X;
drawshape(roof1,[0.7, 0.7, 0.7])

roof2 = translate([0.5,-0.1,1.51]) * rotate(pi/4,2) * scale([0.78;2.2;0]) * X;
drawshape(roof2,[0.7, 0.7, 0.7])

%front panels and the crossing wood
panels_lay1 = translate([0.3,-0.001,0]) *rotate(pi/2,1) * scale([0.4;0.4;1.5]) * X;
drawshape(panels_lay1, 'w')

panels_lay2 = translate([0.35,-0.001,0.05]) *rotate(pi/2,1) * scale([0.3;0.3;1.5]) * X;
drawshape(panels_lay2,[0.85, 0, 0])

wood1 = translate([0.3,-0.01,-0.34]) * rotate(-pi/4,2) * translate([0.5,0,0]) * rotate(pi/2, 1) * scale([0.05;0.5;0]) * X;
drawshape(wood1, 'w')

wood2 = translate([0.71,-0.01,-0.3]) * rotate(-pi/2,2) * translate([0.3,-0.01,-0.34]) * rotate(-pi/4,2) * translate([0.5,0,0]) * rotate(pi/2, 1) * scale([0.05;0.5;0]) * X;
drawshape(wood2, 'w')

%illusion of sky even though its just a shape fitted to space
z_background1 = scale([3;1;2]) * translate([-0.5,2.5,1]) * rotate(-pi/2, 1) * X;
drawshape(z_background1,[0 0.7 1])

z_background2 = translate([1.5,-0.5,0]) * rotate(-pi/2, 2) * scale([2;3;1]) * X;
drawshape(z_background2,[0 0.7 1]) 

%fences, white or brown, for brown fence use [0.6 0.3 0.2]
%for white use 'w'
fencex = translate([1,-0.5,0]) * rotate(pi/2,1) * scale([0.072;0.2;0]) * P;
drawshape(fencex,[0.6 0.3 0.2])

for i=1:6
    fencex = translate([0.072,0,0]) * fencex;
    drawshape(fencex,[0.6 0.3 0.2]) 
end

fencex_2 = translate([-1.07,0,0]) * translate([1,-0.5,0]) * rotate(pi/2,1) * scale([0.072;0.2;0]) * P;
drawshape(fencex_2,[0.6 0.3 0.2])

for i=-5:0
    fencex_2 = translate([-0.072,0,0]) * fencex_2;
    drawshape(fencex_2,[0.6 0.3 0.2])
end

fencex_3 = translate([-1.5,2.99,0]) * translate([1,-0.5,0]) * rotate(pi/2,1) * scale([0.072;0.2;0]) * P;
drawshape(fencex_3,[0.6 0.3 0.2])

for i=-5:21
    fencex_3 = translate([0.072,0,0]) * fencex_3;
    drawshape(fencex_3,[0.6 0.3 0.2])
end

fencey_1 = translate([-0.5 -0.424 0]) * rotate(-pi/2, 2) * rotate(-pi/2, 3) * scale([0.071;0.2;0]) * P;
drawshape(fencey_1,[0.6 0.3 0.2]) 

for i=-5:35
    fencey_1 = translate([0,0.071,0]) * fencey_1;
    drawshape(fencey_1,[0.6 0.3 0.2])
end

fencey_2 = translate([1.99 0 0]) * translate([-0.5 -0.424 0]) * rotate(-pi/2, 2) * rotate(-pi/2, 3) * scale([0.071;0.2;0]) * P;
drawshape(fencey_2,[0.6 0.3 0.2]) 

for i=-5:35
    fencey_2 = translate([0,0.071,0]) * fencey_2;
    drawshape(fencey_2,[0.6 0.3 0.2])
end


end

%core repsquare, reppentagon, scale, translate, rotate, and drawshape functions
function S = scale(c)

c1 = c(1);
c2 = c(2);
c3 = c(3);

S = diag([c1, c2, c3, 1]);

end

function T = translate(p)

x0 = p(1);
y0 = p(2);
z0 = p(3);


T = eye(4);
T(1,4) = x0;
T(2,4) = y0;
T(3,4) = z0;
T(4,4) = 1;


end

function R = rotate(theta, ax)

if ax == 1
    R = zeros(4,4);
    R(1,1) = 1;
    R(4,4) = 1;
    R(2,2) = cos(theta);
    R(2,3) = -sin(theta);
    R(3,2) = sin(theta);
    R(3,3) = cos(theta);
end
    

if ax == 2
    R = zeros(4,4);
    R(1,1) = cos(theta);
    R(2,2) = 1;
    R(1,3) = sin(theta);
    R(3,3) = cos(theta);
    R(3,1) = -sin(theta);
    R(4,4) = 1;
end
    
if ax == 3
    R = zeros(4,4);
    R(1,1) = cos(theta);
    R(1,2) = -sin(theta);
    R(2,1) = sin(theta);
    R(2,2) = cos(theta);
    R(3,3) = 1;
    R(4,4) = 1;
end


end

function X = repsquare()

x = [0 1 1 0];
y = [0 0 1 1];
z = [0 0 0 0];
h = [1 1 1 1];
X = [x; y; z; h];
end

function X = reppentagon()
x = [0 0 0.5 1 1];
y = [0 1 1.5 1 0];
z = [0 0 0 0 0];
h = [1 1 1 1 1];
X = [x; y; z; h];
end

function drawshape(X,c)
x = X(1,:);
y = X(2,:);
z = X(3,:);
fill3(x,y,z,c);
hold on;
end

#Cristopher Sagastume 18640
#Pablo Dardon 17320
#Gráficas de dipolos eléctricos y expansión multipolar


1;

clf
figure( 1 );   
e0 = 8.85 .*10 .^-12;                

r=linspace(-1,1);
phi=linspace(-pi/2,pi/2);
theta=linspace(0,2*pi);
[phi,theta]=meshgrid(phi,theta);
r=meshgrid(r);

%Gráfica del potencial 

subplot(2,2,1);
[x,y,z]=sph2cart(theta,phi,r);
V= (1 .*sin(theta).*cos(phi)) ./ (4 .*pi .*e0 .*r.^2);
C = r.*theta;
surf(theta,phi,V,C);

axis( [0, 7, -2,2 ] );
title( 'Potencial eléctrico esfericas', 'fontsize', 10, 'fontweight', 'normal' );
xlabel("x");
ylabel("y");
zlabel("V");


%[x,y,z] = sph2cart(theta,phi,r);
%quiver3(y,v,z,Ex,Ey,Ez);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ASÍ DEBE QUEDAR EL CAMPO, COMO ESFERA (CORREGIR)

subplot(2,2,2);
[X,Y,Z] = sphere(10);
[U,V,W] = surfnorm(X,Y,Z);
quiver3(X,Y,Z,U,V,W)
axis( [-1.5,1.5,-1.5,1.5,-1.5,1 ] );
title( 'Campo eléctrico esfericas', 'fontsize', 10, 'fontweight', 'normal' );
xlabel("x");
ylabel("y");
zlabel("E");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Campo electrico de un dipolo con un angulo alpha con respecto al eje z
subplot(2,2,3);
[X,Y]=meshgrid(-50:.2:50,-50:.2:50);
E=1.8 .^(-1.5 .*sqrt(X.^2+Y.^2)).*cos(0.5 .*X).*sin(Y);

[DX,DY]=gradient(E,.2,.2);
quiver(X,Y,DX,DY)   
grid on                         %Puts a gridline on the graph
axis([-2 2 -2 2]) 
title( 'Campo eléctrico con angulo alpha', 'fontsize', 10, 'fontweight', 'normal' );
xlabel("x");
ylabel("y");
zlabel("E");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Campo electrico de 2 dipolos cuyo centro esta separado una distancia "a"%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=linspace(-1,1);
phi=linspace(-pi/2,pi/2);
theta=linspace(0,2*pi);
[phi,theta]=meshgrid(phi,theta);
r=meshgrid(r);

%Gráfica del potencial 
a=4; %distnacia de centro a centro de dipolos
q=3; %Valor de la carga de dipolos

subplot(2,2,4);
[x,y,z]=sph2cart(theta,phi,r);
V3= (sin(theta).*cos(theta) .*(1-(3 .*(a)))) ./ (4 .*pi .*e0 .*r.^2);
C = r.*theta;
surf(x,y,V3,C);

axis( [-0.4, 0.4, -0.4, 0.4 ] );
title( 'Potencial eléctrico de dos dipolos distanciados a', 'fontsize', 10, 'fontweight', 'normal' );
xlabel("x");
ylabel("y");
zlabel("V");
 
figure(2);
subplot(2,2,1)
%Gráfica de Campo Electrico

Nx = 101;     
Ny = 101;     
mpx = ceil(Nx/2); 
mpy = ceil(Ny/2); 

Ni = 100;  

V = zeros(Nx,Ny);   

T = 100;             
B = 100;             
L = -100;            
R = -100;            

V(1,:) = L;
V(Nx,:) = R;
V(:,1) = B;
V(:,Ny) = T;

V(1,1) = 0.5*(V(1,2)+V(2,1));
V(Nx,1) = 0.5*(V(Nx-1,1)+V(Nx,2));
V(1,Ny) = 0.5*(V(1,Ny-1)+V(2,Ny));
V(Nx,Ny) = 0.5*(V(Nx,Ny-1)+V(Nx-1,Ny));

eps_0 = 8.854*(10^-12);             
eps = eps_0
charge_order = 10^-9; 

n = 4; 

Q = [2,-2,-2,2]*charge_order; 


X = 0.5*[10,10,-10,-10];
Y = 0.5*[10,-10,10,-10];  

X = X+mpx;  
Y = Y+mpy;

Rho = zeros(Nx,Ny);  
for k = 1:n 
        Rho(X(k),Y(k)) = Q(k)/eps;
end

for l = 1:n       
    for z = 1:Ni    
        for i=2:Nx-1
          for j=2:Ny-1
                V(i,j)=0.25*(V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1)+Rho(i,j));
          end
        end
    end
end

V = V';
E = gradient(V);
E = -E;
[Ex,Ey] =gradient(V);
Ex = -Ex;
Ey = -Ey;

x_range = (1:Nx)-mpx;
y_range = (1:Ny)-mpy;

hold on;
quiver(x_range,y_range,Ex,Ey,4);
axis([-10 10 -10 10]);
title('Campo electrico con dos dipolos distanciados a=5','fontsize',14)
xlabel('x','fontsize',14);
ylabel('y','fontsize',14);


%problema de expansión multipolar potencial electrico aproximado
subplot(2,2,2);
r=linspace(-1,10);
theta=linspace(0,2*pi,100);
[r,theta]=meshgrid(r,theta);
[x,y]=pol2cart(r,theta);
V4=((1)./(4 .*pi .*e0)).* ((1 ./4)-(((r.^2)./(120)).*(1).*(cos(theta))));

C=r.*theta;
surf(x,y,V4);

axis( [-10, 10, -10,10 ] );
title( 'Potencial eléctrico aproximado a densidad dada problema dipolos', 'fontsize', 10, 'fontweight', 'normal' );
xlabel("x");
ylabel("y");
zlabel("V");









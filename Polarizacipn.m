#Cristopher Sagastume 18640
#Pablo Dardon 17320
#Gráficas de Polarización

%densidad de carga problema 1 de polarización (mapa de colores)
e0 = 8.85 .*10 .^-12;    
er=2.4 .*10 .^-12;
k=3
subplot(2,2,1);
[theta, r] = meshgrid(0:2 .*pi,2:10);
C=((2)./(5 .*r)).*(k.*exp(-(r).^2 ./(5)));
[x,y]=pol2cart(theta,r);
surf(x,y,C);
colorbar;
title( 'Densidad superficial', 'fontsize', 10, 'fontweight', 'normal' );
xlabel("x");
ylabel("y");
zlabel("z");
set(get(colorbar,'Title'),'String','Densidad C/m^2')


%campo electrico


subplot(2,2,2);
[theta, r] = meshgrid(0:2 .*pi,2:10);

C=((2)./(4 .*r.^2 .*pi .*e0))-((5 .*exp(-(r).^2 ./(5)))./(e0));
[DX,DY]=gradient(C);
[x,y]=pol2cart(theta,r);
quiver(x,y,DX,DY);

title( 'Campo Eléctrico', 'fontsize', 10, 'fontweight', 'normal' );
xlabel("x");
ylabel("y");
zlabel("z");

%Densidad


subplot(2,2,3);
[phi, theta] = meshgrid(0:pi./60:2 .*pi,-pi./2:pi./60:pi./2);
C=k*cos(2 .*theta);
[x,y,z] = sph2cart(phi,theta,2);
surf(x,y,z,C);
colorbar;
title( 'Densidad superficial', 'fontsize', 10, 'fontweight', 'normal' );
xlabel("x");
ylabel("y");
zlabel("z");
set(get(colorbar,'Title'),'String','Densidad')
%mapa de colores densidad superficial a
##subplot(2,2,4);
##[theta, r] = meshgrid(0:2 .*pi,2:10);
##C=(-(2 ./(4 .*pi.*4)).*(1-(1)./(er)));
##[x,y]=pol2cart(theta,r);
##surf(theta,r,C);
##colorbar;
##title( 'Densidad superficial', 'fontsize', 10, 'fontweight', 'normal' );
##xlabel("x");
##ylabel("y");
##zlabel("z");
##set(get(colorbar,'Title'),'String','Densidad C/m^2')
##%mapa de colores densidad superficial b
##subplot(2,2,4);
##[theta, r] = meshgrid(0:2 .*pi,2:10);
##C=(-(2 ./(4 .*pi.*9)).*(1-(1)./(er)));
##[x,y]=pol2cart(theta,r);
##surf(theta,r,C);
##colorbar;
##title( 'Densidad superficial', 'fontsize', 10, 'fontweight', 'normal' );
##xlabel("x");
##ylabel("y");
##zlabel("z");
##set(get(colorbar,'Title'),'String','Densidad C/m^2')
##%mapa de colores densidad volumetrica
##subplot(2,2,3);
##[theta, r] = meshgrid(0:2 .*pi,2:10);
##[phi]=meshgrid(-pi./2:pi./2);
##C=(3 .*k);
##[x,y]=pol2cart(theta,r);
##surface(x,y,C);
##colorbar;
##title( 'Densidad superficial', 'fontsize', 10, 'fontweight', 'normal' );
##xlabel("x");
##ylabel("y");
##zlabel("z");
##set(get(colorbar,'Title'),'String','Densidad C/m^2')
##
##%mapa de colores densidad superficial b
##subplot(2,2,4);
##[theta, r] = meshgrid(0:2 .*pi,2:10);
##C=(k.*3);
##[x,y]=pol2cart(theta,r);
##surf(theta,r,C);
##colorbar;
##title( 'Densidad superficial', 'fontsize', 10, 'fontweight', 'normal' );
##xlabel("x");
##ylabel("y");
##zlabel("z");
##set(get(colorbar,'Title'),'String','Densidad C/m^2')
##figure(2);
##
##%mapa de colores densidad superficial 2b
##subplot(2,2,4);
##[theta, r] = meshgrid(0:2 .*pi,2:10);
##C=(-k.*2 .*3);
##[x,y]=pol2cart(theta,r);
##surf(theta,r,C);
##colorbar;
##title( 'Densidad superficial', 'fontsize', 10, 'fontweight', 'normal' );
##xlabel("x");
##ylabel("y");
##zlabel("z");
##set(get(colorbar,'Title'),'String','Densidad C/m^2')




% PRA 1: Definir 5 clases con 7 representantes sin traslape
% y pedir al usuario vectores interactivamente.

clc; clear; close all;

% 1. Definir los centroides de las 5 clases para que no se traslapen
mu1 = [-5, 5];
mu2 = [5, 5];
mu3 = [-5, -5];
mu4 = [0, 0];
mu5 = [5, -5];

% 2. Generar 7 representantes por clase (usando ruido gaussiano con poca dispersión)
num_rep = 7;
dispersion = 0.6; % Desviación estándar baja para evitar traslapes

C1 = repmat(mu1, num_rep, 1) + dispersion * randn(num_rep, 2);
C2 = repmat(mu2, num_rep, 1) + dispersion * randn(num_rep, 2);
C3 = repmat(mu3, num_rep, 1) + dispersion * randn(num_rep, 2);
C4 = repmat(mu4, num_rep, 1) + dispersion * randn(num_rep, 2);
C5 = repmat(mu5, num_rep, 1) + dispersion * randn(num_rep, 2);

% 3. Graficar las clases iniciales
figure;
hold on; grid on;
plot(C1(:,1), C1(:,2), 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'C1');
plot(C2(:,1), C2(:,2), 'bo', 'MarkerFaceColor', 'b', 'DisplayName', 'C2');
plot(C3(:,1), C3(:,2), 'go', 'MarkerFaceColor', 'g', 'DisplayName', 'C3');
plot(C4(:,1), C4(:,2), 'mo', 'MarkerFaceColor', 'm', 'DisplayName', 'C4');
plot(C5(:,1), C5(:,2), 'co', 'MarkerFaceColor', 'c', 'DisplayName', 'C5');
title('Práctica 1: 5 Clases con 7 representantes');
legend('Location', 'best');
axis([-8 8 -8 8]);

% 4. Ciclo interactivo con el usuario
continuar = 's';

while lower(continuar) == 's'
% Pedir la ubicación de x (vector)
disp('Ingrese la ubic. de vector x:');
val_x = input('x: ');
val_y = input('y: ');

% Graficar el punto del usuario (como una cruz negra grande)
plot(val_x, val_y, 'kx', 'MarkerSize', 12, 'LineWidth', 2, 'HandleVisibility', 'off');

% Preguntar si desea probar otra vez
continuar = input('¿deseas probar otra vez (s/n)? ', 's');

if lower(continuar) == 'n'
    disp('bye.');
end


end
hold off;

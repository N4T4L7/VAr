% PRA 2: Definir las 5 clases usadas en la PRA 1
% y crear un menú para clasificar por Distancia Mínima o Mahalanobis.

clc; clear; close all;

% 1. Recrear las 5 clases de la PRA 1
num_rep = 7; dispersion = 0.6;
C1 = repmat([-5, 5], num_rep, 1) + dispersion * randn(num_rep, 2);
C2 = repmat([5, 5], num_rep, 1) + dispersion * randn(num_rep, 2);
C3 = repmat([-5, -5], num_rep, 1) + dispersion * randn(num_rep, 2);
C4 = repmat([0, 0], num_rep, 1) + dispersion * randn(num_rep, 2);
C5 = repmat([5, -5], num_rep, 1) + dispersion * randn(num_rep, 2);

% Guardar en celdas para facilitar cálculos iterativos
Clases = {C1, C2, C3, C4, C5};

% Calcular medias (centroides) y matrices de covarianza para cada clase
Medias = zeros(5, 2);
Covarianzas = cell(1, 5);
for i = 1:5
Medias(i, :) = mean(Clases{i});
Covarianzas{i} = cov(Clases{i});
end

% 2. Mostrar Menú del día
disp('=== Nuestro Menú del día/hoy ===');
disp('1) Dist. Mínima (Euclidiana al centroide)');
disp('2) Dist. Mahalanobis');
opcion = input('Seleccione una opción (1 o 2): ');

% 3. Pedir el vector al usuario
disp('Ingrese la ubicación del nuevo vector a clasificar:');
x_val = input('x: ');
y_val = input('y: ');
vector_nuevo = [x_val, y_val];

distancias = zeros(1, 5);

% 4. Lógica de clasificación
if opcion == 1
% 1) Distancia Mínima (Euclidiana)
for i = 1:5
% Norma de la diferencia entre el vector y el centroide
distancias(i) = norm(vector_nuevo - Medias(i, :));
end
metodo = 'Distancia Mínima';

elseif opcion == 2
% 2) Distancia de Mahalanobis
for i = 1:5
dif = vector_nuevo - Medias(i, :);
% Fórmula: sqrt( (x-mu) * Sigma^-1 * (x-mu)' )
distancias(i) = sqrt(dif * inv(Covarianzas{i}) * dif');
end
metodo = 'Distancia de Mahalanobis';
else
disp('Opción no válida.');
return;
end

% Encontrar la clase con la menor distancia
[dist_minima, clase_asignada] = min(distancias);

% 5. Mostrar resultados
fprintf('\nResultados usando %s:\n', metodo);
for i=1:5
fprintf('Distancia a C%d: %.4f\n', i, distancias(i));
end
fprintf('-> El vector pertenece a la Clase: C%d\n', clase_asignada);

% Graficar para visualizar
figure; hold on; grid on;
colores = ['r', 'b', 'g', 'm', 'c'];
for i = 1:5
plot(Clases{i}(:,1), Clases{i}(:,2), [colores(i) 'o'], 'MarkerFaceColor', colores(i));
end
plot(x_val, y_val, 'kx', 'MarkerSize', 12, 'LineWidth', 2);
title(sprintf('Clasificación por %s: Clase %d', metodo, clase_asignada));
hold off;

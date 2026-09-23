% PRA 2: Definir las 5 clases y menú de distancias (Mínima y Mahalanobis)
clc; clear all; close all; warning off all;

% 1. Definir los centroides y generar 5 clases
num_rep = 7;
dispersion = 6;

mu1 = [-50; 50];
mu2 = [50; 50];
mu3 = [-50; -50];
mu4 = [0; 0];
mu5 = [50; -50];

c1 = repmat(mu1, 1, num_rep) + dispersion * randn(2, num_rep);
c2 = repmat(mu2, 1, num_rep) + dispersion * randn(2, num_rep);
c3 = repmat(mu3, 1, num_rep) + dispersion * randn(2, num_rep);
c4 = repmat(mu4, 1, num_rep) + dispersion * randn(2, num_rep);
c5 = repmat(mu5, 1, num_rep) + dispersion * randn(2, num_rep);

clases = {c1, c2, c3, c4, c5};

% 2. Graficar las 5 clases iniciales
figure(1)
hold on; grid on;
colores = ['r', 'b', 'g', 'm', 'c'];

for i = 1:5
    plot(clases{i}(1,:), clases{i}(2,:), [colores(i) 'o'], ...
        'MarkerSize', 8, 'MarkerFaceColor', colores(i), ...
        'DisplayName', ['Clase ' num2str(i)]);
end

axis([-100 100 -100 100]);
axis square;
title('Práctica 2: Clasificación de Vectores');
legend('Location', 'northeastoutside');

% 3. Ciclo interactivo y Menú del Día
continuar = 's';

while lower(continuar) == 's'
    disp(' ');
    disp('=============================================');
    disp('             INGRESAR VECTOR                 ');
    disp('=============================================');
    vx = input('  >> Coordenada en X: ');
    vy = input('  >> Coordenada en Y: ');
    vector = [vx; vy];

    % Generar un color RGB aleatorio para este punto específico
    color_punto = rand(1, 3) * 0.8;

    if vx < -100 || vx > 100 || vy < -100 || vy > 100
        disp('---------------------------------------------');
        fprintf('  [!] El vector [%.2f, %.2f] está FUERA DE LÍMITES.\n', vx, vy);
        disp('---------------------------------------------');

        plot(vx, vy, 'x', 'MarkerSize', 14, 'LineWidth', 3, 'Color', color_punto, 'DisplayName', 'Fuera de límite');
    else
        disp(' ');
        disp('=============================================');
        disp('             NUESTRO MENÚ DEL DÍA            ');
        disp('=============================================');
        disp('  [ 1 ] Distancia Mínima (Euclidiana)');
        disp('  [ 2 ] Distancia de Mahalanobis');
        disp('---------------------------------------------');
        opcion = input('  >> Selecciona una opción (1 o 2): ');

        distancias = zeros(1, 5);

        if opcion == 1
            metodo = 'Distancia Mínima';
            for i = 1:5
                media = mean(clases{i}, 2);
                distancias(i) = sqrt((vector(1) - media(1))^2 + (vector(2) - media(2))^2);
            end

        elseif opcion == 2
            metodo = 'Distancia de Mahalanobis';
            for i = 1:5
                clase_actual = clases{i};
                media = mean(clase_actual, 2);
                dato = clase_actual - media;
                matriz_cov = (1/length(clase_actual)) * (dato * dato');
                inversa = inv(matriz_cov);
                distancias(i) = sqrt((vector - media)' * inversa * (vector - media));
            end
        else
            disp('  [!] Opción no válida. Intenta de nuevo.');
            continue;
        end

        [minimo, busca] = min(distancias);

        disp(' ');
        disp('---------------------------------------------');
        fprintf('  RESULTADO: Pertenece a la CLASE %d\n', busca);
        fprintf('  Método: %s\n', metodo);
        fprintf('  Distancia: %.2f\n', minimo);
        disp('---------------------------------------------');

        % 1. Calcular el centroide de la clase ganadora
        centroide_ganador = mean(clases{busca}, 2);

        % 2. Trazar la línea punteada hacia el centroide
        plot([vector(1), centroide_ganador(1)], [vector(2), centroide_ganador(2)], '--', ...
             'Color', color_punto, 'LineWidth', 1.5, 'HandleVisibility', 'off');

        % 3. Graficar la 'x' del vector
        plot(vector(1), vector(2), 'x', ...
            'MarkerSize', 14, 'LineWidth', 3, 'Color', color_punto, ...
            'DisplayName', ['Vector -> C' num2str(busca)]);
    end

    % REFORZAR LOS LÍMITES PARA EVITAR QUE LA GRÁFICA HAGA ZOOM
    axis([-100 100 -100 100]);

    legend('Location', 'northeastoutside');

    disp(' ');
    continuar = input('¿Deseas probar otra vez (s/n)? ', 's');
end
hold off;

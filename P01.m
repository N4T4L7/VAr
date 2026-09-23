% PRA 1: Definir 5 clases con 7 representantes sin traslape

clc; clear; close all;

% 1. Definir los centroides (escalados para el rango de 100)
mu1 = [-50, 50];
mu2 = [50, 50];
mu3 = [-50, -50];
mu4 = [0, 0];
mu5 = [50, -50];

% 2. Generar 7 representantes por clase
num_rep = 7;
dispersion = 6; % Dispersión aumentada proporcionalmente

C1 = repmat(mu1, num_rep, 1) + dispersion * randn(num_rep, 2);
C2 = repmat(mu2, num_rep, 1) + dispersion * randn(num_rep, 2);
C3 = repmat(mu3, num_rep, 1) + dispersion * randn(num_rep, 2);
C4 = repmat(mu4, num_rep, 1) + dispersion * randn(num_rep, 2);
C5 = repmat(mu5, num_rep, 1) + dispersion * randn(num_rep, 2);

% Para cada clase calculamos [(max_x + min_x)/2, (max_y + min_y)/2]
mu_maxmin = zeros(5, 2);

clases = {C1, C2, C3, C4, C5};
for i = 1:5
    c_actual = clases{i};

    min_x = min(c_actual(:,1));
    max_x = max(c_actual(:,1));

    min_y = min(c_actual(:,2));
    max_y = max(c_actual(:,2));

    % Punto medio del rango
    mu_maxmin(i, 1) = (max_x + min_x) / 2;
    mu_maxmin(i, 2) = (max_y + min_y) / 2;
end

% 3. Graficar las clases iniciales y sus centroides calculados
figure;
hold on; grid on;
colores = ['r', 'b', 'g', 'm', 'c'];

for i = 1:5
    plot(clases{i}(:,1), clases{i}(:,2), [colores(i) 'o'], ...
         'MarkerFaceColor', colores(i), 'DisplayName', ['C' num2str(i)]);

    % Graficar el centroide calculado con una estrella
    plot(mu_maxmin(i,1), mu_maxmin(i,2), [colores(i) 'p'], ...
         'MarkerSize', 12, 'MarkerFaceColor', 'k', 'HandleVisibility', 'off');
end

title('Práctica 1: Clasificación de vectores por Distancia a Centroides (Max/Min)');
legend('Location', 'best');

axis([-100 100 -100 100]);

% 4. Ciclo interactivo con el usuario
continuar = 's';

while lower(continuar) == 's'
    disp('Ingrese la ubicación del vector x:');
    val_x = input('x: ');
    val_y = input('y: ');

    % VALIDACIÓN DE LÍMITES (-100 a 100)
    if val_x < -100 || val_x > 100 || val_y < -100 || val_y > 100
        fprintf('\n>> El vector [%.2f, %.2f] está FUERA DE LOS LÍMITES. No pertenece a ninguna clase.\n\n', val_x, val_y);

        % Graficar en negro para indicar que no tiene clase y agregarlo a la leyenda
        leyenda_txt = sprintf('Vector [%.1f, %.1f] -> Sin Clase', val_x, val_y);
        plot(val_x, val_y, 'kx', 'MarkerSize', 14, 'LineWidth', 2, 'DisplayName', leyenda_txt);

    else
        % CÁLCULO DE DISTANCIAS A LOS CENTROIDES (Máximos y Mínimos)
        distancias = zeros(1, 5);
        for i = 1:5
            % Distancia euclidiana desde el vector al centroide de la clase i
            distancias(i) = sqrt((val_x - mu_maxmin(i,1))^2 + (val_y - mu_maxmin(i,2))^2);
        end

        % Clasificar según la menor distancia
        [dist_min, clase_ganadora] = min(distancias);

        fprintf('\n>> El vector [%.2f, %.2f] pertenece a la Clase C%d (Distancia: %.2f)\n\n', ...
                val_x, val_y, clase_ganadora, dist_min);

        % Crear texto para la leyenda y graficar con el color de su clase
        leyenda_txt = sprintf('Vector [%.1f, %.1f] -> C%d', val_x, val_y, clase_ganadora);

        plot(val_x, val_y, 'kx', 'MarkerSize', 14, 'LineWidth', 3, 'HandleVisibility', 'off'); % Borde negro
        plot(val_x, val_y, [colores(clase_ganadora) 'x'], 'MarkerSize', 12, 'LineWidth', 2, 'DisplayName', leyenda_txt);
    end

    % Actualizar la leyenda de la gráfica en cada iteración
    legend('Location', 'best');

    continuar = input('¿Deseas probar otra vez (s/n)? ', 's');

    if lower(continuar) == 'n'
        disp('Chayito <3');
    end
end
hold off;

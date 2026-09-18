# 👁️ Visión Artificial - Prácticas de Laboratorio

**Escuela Superior de Cómputo (ESCOM) - IPN**  
**Carrera:** Ingeniería en Inteligencia Artificial  

---

## 👥 Autores
* 👩‍💻 **[Gurrola Pérez Natalia Annais]** 
* 👨‍💻 **[Nombre del segundo integrante]**

---

## 🛠️ Herramienta Utilizada: GNU Octave
Todas las prácticas de este repositorio están desarrolladas en **GNU Octave**, un lenguaje de alto nivel orientado al cálculo numérico y reconocimiento de patrones.

### Guía de Uso

1. **📥 Descargar e Instalar:** 
   Si no cuentas con el entorno, descarga la versión oficial desde [octave.org](https://octave.org/download).
2. **📂 Configurar el Directorio:** 
   Descarga los archivos de este repositorio. Abre Octave y, en la barra superior de la interfaz, asegúrate de cambiar el **Current Directory** (Directorio actual) para que apunte a la carpeta exacta donde guardaste los archivos `.m`.
3. **▶️ Ejecutar el Código:** 
   Dirígete a la pestaña **Command Window** en la parte inferior de la pantalla. Escribe el nombre del archivo de la práctica sin la extensión `.m` (por ejemplo, escribe `P01` o `P02`) y presiona **Enter**. Interactúa con el programa introduciendo los valores que se soliciten en la consola.

---

## 🗂️ Índice de Prácticas

### 📍 Práctica 1: Generación y Visualización de Clases
**Descripción:** Script que genera datos sintéticos creando 5 clases bidimensionales distintas (con 7 representantes cada una), empleando control de dispersión para asegurar que no existan traslapes. El programa incluye un ciclo interactivo que pide al usuario las coordenadas de un nuevo vector bidimensional $\vec{x}$ para graficar en tiempo real su posición en el plano cartesiano respecto a las 5 agrupaciones generadas.

🔗 **[Ver código fuente (P01.m)](./P01.m)**

### 📍 Práctica 2: Clasificación Euclidiana y de Mahalanobis
**Descripción:** Esta práctica hereda las agrupaciones generadas en la Práctica 1 y añade un sistema de clasificación algorítmica mediante un menú interactivo. Permite al usuario clasificar el nuevo vector introducido midiendo matemáticamente a qué clase pertenece basándose en dos métodos de reconocimiento de patrones: Distancia Mínima (Euclidiana hacia los centroides) y Distancia de Mahalanobis (tomando en cuenta la matriz de covarianza).

🔗 **[Ver código fuente (P02.m)](./P02.m)**

import numpy as np
import matplotlib.pyplot as plt

# Datos de ejemplo
y = [67, 127, 143, 159, 170]
x = [10, 15, 20, 25, 30]

yprima = [327, 407, 487, 567, 647]
xprima = [10, 15, 20, 25, 30]

# Ajustar una línea de tendencia de primer grado
coefficients = np.polyfit(x, y, 1)
p = np.poly1d(coefficients)

coefficientsprima = np.polyfit(xprima, yprima, 1)
pprima = np.poly1d(coefficientsprima)

# Crear la gráfica de barras
plt.bar(np.array(x)-1, y, align='center', width=0.4, label='y')
plt.bar(np.array(xprima)+1, yprima, align='center', width=0.4, label='yprima')

# Trazar la línea de tendencia y la fórmula matemática de cada una
plt.plot(x, p(x), 'r--', label='linea de tendencia de y')
plt.text(10, 60, f'y = {round(coefficients[0],2)}x + {round(coefficients[1],2)}', color='black')

plt.plot(xprima, pprima(xprima), 'b--', label='linea de tendencia de yprima')
plt.text(12, 320, f'yprima = {round(coefficientsprima[0],2)}x + {round(coefficientsprima[1],2)}', color='black')

# Añadir etiquetas a los ejes y leyenda
plt.ylabel('Numero ciclos de reloj')
plt.xlabel('Tamaño sucesion')
plt.legend()

# Mostrar la gráfica
plt.savefig('./img/grafica.png')
.data
valor_inicial: .word 66
secuencia: .space 120*4
secuencia_tamanho: .word 0
secuencia_maximo: .word 0
secuencia_valor_medio: .float 0.0
lista: .space 9*4
lista_valor_medio: .float 0.0
inv_nine: .float 0.1111111    

.text
.global main

main:
    lw r2, valor_inicial       ; Carga el valor inicial en el registro r2
    addi r8, r0, 4             ; Incrementa la dirección de memoria para el siguiente término
    add r4, r0, r2             ; A[n] inicializado con el valor inicial
    sw secuencia, r2           ; Almacena el valor inicial en la secuencia
    add r10, r0, r2            ; Inicializa el valor máximo con el valor inicial
    add r11, r0, r2            ; Inicializa el acumulador para el valor medio con el valor inicial

loop:
andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Segunda iteración
    
    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Tercera iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Cuarta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Quinta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Sexta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Séptima iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Octava iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    

calculate_average:
    ; Calcular el número de pasos dividiendo r8 entre 4 y convertir a punto flotante
    srli r9, r8, 2
    movi2fp f1, r11
    movi2fp f3, r9
    cvti2f f1, f1
    cvti2f f3, f3
    

    ; Mover el acumulador entero al registro FP y convertir a punto flotante

    ; Dividir el acumulador por el tamaño para obtener el promedio
    divf f1, f1, f3

    ; Almacenar el valor medio y el valor máximo en memoria

    sw secuencia_maximo, r10

    ; Almacenar el tamaño de la secuencia en memoria
    sw secuencia_tamanho, r9

    movi2fp f4, r10
    movi2fp f2, r2
    cvti2f f4, f4

    
    cvti2f f2, f2


    sf secuencia_valor_medio, f1
    ; Convertir valores enteros a punto flotante para las operaciones
    divf f14, f3, f4    ; vT/vMax
    lf f21, inv_nine  ; Cargar el valor de 1/9 en f4
    ; En f1 se encuentra el valor la media de la secuencia, en f2 el valor inicial y en f3 el tamaño de la secuencia y en f4 el valor máximo

    ; Realizar cálculos para la lista
    ; Precalcular inversos

    multf f5, f2, f3   ; vIni * vT
    divf f15, f3, f1   ; vT/vMed
    multf f6, f4, f3   ; vMax * vT
    sf lista, f5
    multf f7, f1, f3   ; vMed * vT
    addf f20, f5, f6

    divf f16, f3, f2   ; vT/vIni
    addf f20, f20, f7
    sf lista+4, f6
    sf lista+8, f7

    ; Utilizar inversos para simplificar cálculos


    multf f8, f2, f14  ; vIni * (1/vMax) * vT

    multf f9, f2, f15  ; vIni * (1/vMed) * vT
    sf lista+12, f8
    addf f20, f20, f8
    multf f10, f4, f16 ; vMax * (1/vIni) * vT
    sf lista+16, f9
    multf f11, f4, f15 ; vMax * (1/vMed) * vT
    sf lista+20, f10
    addf f20, f20, f9
    multf f12, f1, f16 ; vMed * (1/vIni) * vT
    addf f20, f20, f10
    multf f13, f1, f14 ; vMed * (1/vMax) * vT

    ; Almacenar resultados en memoria
    sf lista+24, f11
    addf f20, f20, f11
    sf lista+28, f12
    addf f20, f20, f12
    sf lista+32, f13

    ; Calcular el valor medio de los elementos de la lista
    addf f20, f20, f13

    multf f20, f20, f21 ; Multiplicar por 1/9

    sf lista_valor_medio, f20  ; Almacena el valor medio de la lista en lista_valor_medio

    trap 0                     ; Termina el programa
   
odd:
    ; Caso impar
    add r5, r5, r4             ; Suma el valor original para obtener el triple
    addi r4, r5, 1             ; Suma 1 para obtener el valor final y actualiza r4 para la siguiente iteración
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    slt r12, r10, r4           ; Compara si el valor máximo es menor que A[n]
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    bnez r12, update_max       ; Si es menor, actualiza el valor máximo

loop2:
    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Segunda iteración
    
    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Tercera iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Cuarta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Quinta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Sexta iteración
    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Séptima iteración
    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Octava iteración
    andi r7, r4, 1             ; Verifica si A[n] es impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r8), r4       ; Almacena A[n] en la secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

calculate_average2:
    ; Calcular el número de pasos dividiendo r8 entre 4 y convertir a punto flotante
    srli r9, r8, 2
    movi2fp f1, r11
    movi2fp f3, r9
    cvti2f f1, f1
    cvti2f f3, f3
    

    ; Mover el acumulador entero al registro FP y convertir a punto flotante

    ; Dividir el acumulador por el tamaño para obtener el promedio
    divf f1, f1, f3

    ; Almacenar el valor medio y el valor máximo en memoria

    sw secuencia_maximo, r10

    ; Almacenar el tamaño de la secuencia en memoria
    sw secuencia_tamanho, r9

    movi2fp f4, r10
    movi2fp f2, r2
    cvti2f f4, f4

    
    cvti2f f2, f2


    sf secuencia_valor_medio, f1
    ; Convertir valores enteros a punto flotante para las operaciones
    divf f14, f3, f4    ; vT/vMax
    lf f21, inv_nine  ; Cargar el valor de 1/9 en f4
    ; En f1 se encuentra el valor la media de la secuencia, en f2 el valor inicial y en f3 el tamaño de la secuencia y en f4 el valor máximo

    ; Realizar cálculos para la lista
    ; Precalcular inversos

    multf f5, f2, f3   ; vIni * vT
    divf f15, f3, f1   ; vT/vMed
    multf f6, f4, f3   ; vMax * vT
    sf lista, f5
    multf f7, f1, f3   ; vMed * vT
    addf f20, f5, f6

    divf f16, f3, f2   ; vT/vIni
    addf f20, f20, f7
    sf lista+4, f6
    sf lista+8, f7

    ; Utilizar inversos para simplificar cálculos


    multf f8, f2, f14  ; vIni * (1/vMax) * vT

    multf f9, f2, f15  ; vIni * (1/vMed) * vT
    sf lista+12, f8
    addf f20, f20, f8
    multf f10, f4, f16 ; vMax * (1/vIni) * vT
    sf lista+16, f9
    multf f11, f4, f15 ; vMax * (1/vMed) * vT
    sf lista+20, f10
    addf f20, f20, f9
    multf f12, f1, f16 ; vMed * (1/vIni) * vT
    addf f20, f20, f10
    multf f13, f1, f14 ; vMed * (1/vMax) * vT

    ; Almacenar resultados en memoria
    sf lista+24, f11
    addf f20, f20, f11
    sf lista+28, f12
    addf f20, f20, f12
    sf lista+32, f13

    ; Calcular el valor medio de los elementos de la lista
    addf f20, f20, f13

    multf f20, f20, f21 ; Multiplicar por 1/9

    sf lista_valor_medio, f20  ; Almacena el valor medio de la lista en lista_valor_medio

    trap 0                     ; Termina el programa

update_max:
    add r10, r0, r4            ; Actualiza el valor máximo con A[n]
    j loop                     ; Continúa el bucle


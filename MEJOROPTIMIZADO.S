.data
valor_inicial: .word 97
secuencia: .space 120*4
secuencia_tamanho: .word 0
secuencia_maximo: .word 0
secuencia_valor_medio: .float 0
lista: .space 9*4
lista_valor_medio: .float 0
nueve_inverso: .float 0.1111111    
uno: .float 1

.text
.global main

main:
    lw r4, valor_inicial       ; Carga el valor inicial directamente en el registro r4
    lf f22, valor_inicial        ; Carga el valor inicial en f22
    sw secuencia+4, r4         ; Almacena el valor inicial en la secuencia usando r4
    lf f23, uno                ; Carga el valor 1.0 en f23
    cvti2f f22, f22            ; Convierte el valor inicial a punto flotante
    add r11, r0, r4            ; Inicializa el acumulador para el valor medio con el valor inicial en r4
    divf f22, f23, f22         ; Calcula el inverso del valor inicial y almacena en f22


loop:
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 8             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, oddInicio         ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average4              ; Si A[n] es 1, va a calculate_average

    ; Segunda iteración
    
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average4              ; Si A[n] es 1, va a calculate_average

    ; Tercera iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average4              ; Si A[n] es 1, va a calculate_average

    ; Cuarta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average4              ; Si A[n] es 1, va a calculate_average

    ; Quinta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average4              ; Si A[n] es 1, va a calculate_average

    ; Sexta iteración
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average4              ; Si A[n] es 1, va a calculate_average
    

calculate_average:
    ; Pasamos vMax a punto flotante
    movi2fp f4, r10
    cvti2f f4, f4
    ; Calculamos 1/vIni * vMax y guardamos el resultado en f8
    multf f8, f22, f4
    ; Mientras tanto, calculamos vT y lo almacenamos en f3
    srli r9, r2, 2
    movi2fp f3, r9
    movi2fp f1, r11
    cvti2f f3, f3
    ; Calculamos la suma de los valores de la secuencia y la almacenamos en f1 para calcular el promedio
    
    cvti2f f1, f1
    
    
    
    ; Tenemos en f1 la suma de los valores de la secuencia, en f2 el valor inicial vIni, en f3 el tamaño de la secuencia vT y en f4 el valor máximo vMax
    ; Dividir el acumulador por el tamaño para obtener el promedio vMed
    divf f1, f1, f3 ; f1 = vMed
    ; Calculamos /vIni * vMax * vT y lo almacenamos en f12 
    multf f12, f8, f3
    lf f2 , secuencia+4
    ; Almacenar el tamaño de la secuencia en memoria
    sw secuencia_tamanho, r9
    cvti2f f2, f2
    ; Calculamos vIni * vT y lo almacenamos en f5
    multf f5, f2, f3   ; vIni * vT
    sf lista+20, f12
    
    ; Calculamos vMax * vT y lo almacenamos en f6
    multf f6, f4, f3   ; vMax * vT
    addf f20, f5, f12
    sf lista, f5
    
    

    ; Convertir valores enteros a punto flotante para las operaciones
    divf f14, f3, f4    ; vT/vMax
    sf lista+4, f6
    addf f20, f20, f6
    ; Calculamos 1/vIni * vMed * vT y lo almacenamos en f10
    multf f10, f22, f1
    ; Calculamos 1/vIni * vMed * vT y lo almacenamos en f10
    multf f10, f10, f3    
    
    multf f7, f1, f3   ; vMed * vT
    sf lista+28, f10
    addf f20, f20, f10
    
    divf f15, f3, f1   ; vT/vMed  
    multf f8, f2, f14  ; vIni * vT/vMax
    addf f20, f20, f7
    sf lista+8, f7 
    
    multf f13, f1, f14 ; vMed * vT/vMax
    sf lista+12, f8
    addf f20, f20, f8
    lf f21, nueve_inverso  ; Cargar el valor de 1/9 en f4
    multf f9, f2, f15  ; vIni * vT/vMed
    sf lista+32, f13
    addf f20, f20, f13
    
    multf f11, f4, f15 ; vMax * vT/vMed
    sf lista+16, f9
    addf f20, f20, f9
    addf f20, f20, f11
    
    

    multf f20, f20, f21 ; Multiplicar por 1/9
    sf lista+24, f11
    ; Almacenamos el maximo de la secuencia en memoria
    sw secuencia_maximo, r10
    sf secuencia_valor_medio, f1

    sf lista_valor_medio, f20  ; Almacena el valor medio de la lista en lista_valor_medio

    trap 0                     ; Termina el programa



   
odd:
    ; Caso impar
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda)
    add r5, r5, r4             ; Suma el valor original para obtener el triple
    addi r4, r5, 1             ; Suma 1 para obtener el valor final y actualiza r4 para la siguiente iteración
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    slt r12, r10, r4           ; Compara si el valor máximo es menor que A[n]
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    bnez r12, update_max       ; Si es menor, actualiza el valor máximo

loop2:
        
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia

    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

    ; Segunda iteración
    
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

    ; Tercera iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

    ; Cuarta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Quinta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Sexta iteración
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Séptima iteración
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Octava iteración
     andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

calculate_average2:
        ; Pasamos vMax a punto flotante
    movi2fp f4, r10
    cvti2f f4, f4
    ; Calculamos 1/vIni * vMax y guardamos el resultado en f8
    multf f8, f22, f4
    ; Mientras tanto, calculamos vT y lo almacenamos en f3
    srli r9, r2, 2
    movi2fp f3, r9
    cvti2f f3, f3
    ; Calculamos la suma de los valores de la secuencia y la almacenamos en f1 para calcular el promedio
    movi2fp f1, r11
    cvti2f f1, f1
    
    
    
    ; Tenemos en f1 la suma de los valores de la secuencia, en f2 el valor inicial vIni, en f3 el tamaño de la secuencia vT y en f4 el valor máximo vMax
    ; Dividir el acumulador por el tamaño para obtener el promedio vMed
    divf f1, f1, f3 ; f1 = vMed
    ; Calculamos /vIni * vMax * vT y lo almacenamos en f12 
    multf f12, f8, f3
    lf f2 , secuencia+4
    ; Almacenar el tamaño de la secuencia en memoria
    sw secuencia_tamanho, r9
    cvti2f f2, f2
    ; Calculamos vIni * vT y lo almacenamos en f5
    multf f5, f2, f3   ; vIni * vT
    sf lista+20, f12
    
    ; Calculamos vMax * vT y lo almacenamos en f6
    multf f6, f4, f3   ; vMax * vT
    addf f20, f5, f12
    sf lista, f5
    
    

    ; Convertir valores enteros a punto flotante para las operaciones
    divf f14, f3, f4    ; vT/vMax
    sf lista+4, f6
    addf f20, f20, f6
    ; Calculamos 1/vIni * vMed * vT y lo almacenamos en f10
    multf f10, f22, f1
    ; Calculamos 1/vIni * vMed * vT y lo almacenamos en f10
    multf f10, f10, f3    
    
    multf f7, f1, f3   ; vMed * vT
    sf lista+28, f10
    addf f20, f20, f10
    
    divf f15, f3, f1   ; vT/vMed  
    multf f8, f2, f14  ; vIni * vT/vMax
    addf f20, f20, f7
    sf lista+8, f7 
    
    multf f13, f1, f14 ; vMed * vT/vMax
    sf lista+12, f8
    addf f20, f20, f8
    lf f21, nueve_inverso  ; Cargar el valor de 1/9 en f4
    multf f9, f2, f15  ; vIni * vT/vMed
    sf lista+32, f13
    addf f20, f20, f13
    
    multf f11, f4, f15 ; vMax * vT/vMed
    sf lista+16, f9
    addf f20, f20, f9
    addf f20, f20, f11
    
    

    multf f20, f20, f21 ; Multiplicar por 1/9
    sf lista+24, f11
    ; Almacenamos el maximo de la secuencia en memoria
    sw secuencia_maximo, r10
    sf secuencia_valor_medio, f1

    sf lista_valor_medio, f20  ; Almacena el valor medio de la lista en lista_valor_medio

    trap 0                     ; Termina el programa

update_max:
    add r10, r0, r4            ; Actualiza el valor máximo con A[n]

loop3:
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

    ; Segunda iteración
    
     andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

    ; Tercera iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

    ; Cuarta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Quinta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Sexta iteración
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Séptima iteración
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Octava iteración
     andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia

    
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

calculate_average3:
        ; Pasamos vMax a punto flotante
    movi2fp f4, r10
    cvti2f f4, f4
    ; Calculamos 1/vIni * vMax y guardamos el resultado en f8
    multf f8, f22, f4
    ; Mientras tanto, calculamos vT y lo almacenamos en f3
    
    srli r9, r2, 2
    movi2fp f1, r11
    cvti2f f1, f1
    movi2fp f3, r9
    ; Calculamos la suma de los valores de la secuencia y la almacenamos en f1 para calcular el promedio
    
    cvti2f f3, f3
    
    
    
    
    ; Tenemos en f1 la suma de los valores de la secuencia, en f2 el valor inicial vIni, en f3 el tamaño de la secuencia vT y en f4 el valor máximo vMax
    ; Dividir el acumulador por el tamaño para obtener el promedio vMed
    divf f1, f1, f3 ; f1 = vMed
    ; Calculamos /vIni * vMax * vT y lo almacenamos en f12 
    multf f12, f8, f3
    lf f2 , secuencia+4
    ; Almacenar el tamaño de la secuencia en memoria
    sw secuencia_tamanho, r9
    cvti2f f2, f2
    ; Calculamos vIni * vT y lo almacenamos en f5
    multf f5, f2, f3   ; vIni * vT
    sf lista+20, f12
    
    ; Calculamos vMax * vT y lo almacenamos en f6
    multf f6, f4, f3   ; vMax * vT
    addf f20, f5, f12
    sf lista, f5
    
    

    ; Convertir valores enteros a punto flotante para las operaciones
    divf f14, f3, f4    ; vT/vMax
    sf lista+4, f6
    addf f20, f20, f6
    ; Calculamos 1/vIni * vMed * vT y lo almacenamos en f10
    multf f10, f22, f1
    ; Calculamos 1/vIni * vMed * vT y lo almacenamos en f10
    multf f10, f10, f3    
    
    multf f7, f1, f3   ; vMed * vT
    sf lista+28, f10
    addf f20, f20, f10
    
    divf f15, f3, f1   ; vT/vMed  
    multf f8, f2, f14  ; vIni * vT/vMax
    addf f20, f20, f7
    sf lista+8, f7 
    
    multf f13, f1, f14 ; vMed * vT/vMax
    sf lista+12, f8
    addf f20, f20, f8
    lf f21, nueve_inverso  ; Cargar el valor de 1/9 en f4
    multf f9, f2, f15  ; vIni * vT/vMed
    sf lista+32, f13
    addf f20, f20, f13
    
    multf f11, f4, f15 ; vMax * vT/vMed
    sf lista+16, f9
    addf f20, f20, f9
    addf f20, f20, f11
    
    

    multf f20, f20, f21 ; Multiplicar por 1/9
    sf lista+24, f11
    ; Almacenamos el maximo de la secuencia en memoria
    sw secuencia_maximo, r10
    sf secuencia_valor_medio, f1

    sf lista_valor_medio, f20  ; Almacena el valor medio de la lista en lista_valor_medio

    trap 0                     ; Termina el programa


oddInicio:
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    slli r5, r4, 1             ; Multiplica por 2 (equivale a desplazar un bit a la izquierda) y almacena en r5
    beqz r6, calculate_averageUno              ; Si A[n] es 1, va a calculate_average   
    add r5, r5, r4             ; Suma el valor original para obtener el triple
    addi r4, r5, 1             ; Suma 1 para obtener el valor final y actualiza r4 para la siguiente iteración
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    add r10, r0, r4            ; Actualiza el valor máximo con A[n]
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

loopInicio:
        
        ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia

    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

    ; Segunda iteración
    
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

    ; Tercera iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio

    ; Cuarta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Quinta iteración

    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Sexta iteración
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Séptima iteración
    andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    beqz r6, calculate_average              ; Si A[n] es 1, va a calculate_average

    ; Octava iteración
     andi r7, r4, 1             ; Verifica si A[n] es impar
    addi r2, r2, 4             ; Incrementa la dirección de memoria para el siguiente término
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    
    ; Caso par (en línea)
    srli r4, r4, 1             ; Calcula A[n] / 2 para el caso par y almacena en r4
    sw secuencia(r2), r4       ; Almacena A[n] en la secuencia
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    j calculate_average        ; Si A[n] es 1, va a calculate_average

calculate_averageUno:
    ;Almacenamos el valor inicial en el registro r10
    lw r10, secuencia+4
    srli r2, r2, 1            ; Dividir por 2 para obtener el promedio
    movi2fp f4, r10
    cvti2f f4, f4
    ; Calculamos 1/vIni * vMax y guardamos el resultado en f8
    multf f8, f22, f4
    ; Mientras tanto, calculamos vT y lo almacenamos en f3
    srli r9, r2, 2
    movi2fp f3, r9
    cvti2f f3, f3
    ; Calculamos la suma de los valores de la secuencia y la almacenamos en f1 para calcular el promedio
    movi2fp f1, r11
    cvti2f f1, f1
    
    
    
    ; Tenemos en f1 la suma de los valores de la secuencia, en f2 el valor inicial vIni, en f3 el tamaño de la secuencia vT y en f4 el valor máximo vMax
    ; Dividir el acumulador por el tamaño para obtener el promedio vMed
    divf f1, f1, f3 ; f1 = vMed
    ; Calculamos /vIni * vMax * vT y lo almacenamos en f12 
    multf f12, f8, f3
    lf f2 , secuencia+4
    ; Almacenar el tamaño de la secuencia en memoria
    sw secuencia_tamanho, r9
    cvti2f f2, f2
    ; Calculamos vIni * vT y lo almacenamos en f5
    multf f5, f2, f3   ; vIni * vT
    sf lista+20, f12
    
    ; Calculamos vMax * vT y lo almacenamos en f6
    multf f6, f4, f3   ; vMax * vT
    addf f20, f5, f12
    sf lista, f5
    
    

    ; Convertir valores enteros a punto flotante para las operaciones
    divf f14, f3, f4    ; vT/vMax
    sf lista+4, f6
    addf f20, f20, f6
    ; Calculamos 1/vIni * vMed * vT y lo almacenamos en f10
    multf f10, f22, f1
    ; Calculamos 1/vIni * vMed * vT y lo almacenamos en f10
    multf f10, f10, f3    
    
    multf f7, f1, f3   ; vMed * vT
    sf lista+28, f10
    addf f20, f20, f10
    
    divf f15, f3, f1   ; vT/vMed  
    multf f8, f2, f14  ; vIni * vT/vMax
    addf f20, f20, f7
    sf lista+8, f7 
    
    multf f13, f1, f14 ; vMed * vT/vMax
    sf lista+12, f8
    addf f20, f20, f8
    lf f21, nueve_inverso  ; Cargar el valor de 1/9 en f4
    multf f9, f2, f15  ; vIni * vT/vMed
    sf lista+32, f13
    addf f20, f20, f13
    
    multf f11, f4, f15 ; vMax * vT/vMed
    sf lista+16, f9
    addf f20, f20, f9
    addf f20, f20, f11
    
    

    multf f20, f20, f21 ; Multiplicar por 1/9
    sf lista+24, f11
    ; Almacenamos el maximo de la secuencia en memoria
    sw secuencia_maximo, r10
    sf secuencia_valor_medio, f1

    sf lista_valor_medio, f20  ; Almacena el valor medio de la lista en lista_valor_medio

    trap 0                     ; Termina el programa

calculate_average4:

    ;Almacenamos el valor inicial en el registro r10
    lw r10, secuencia+4
    movi2fp f4, r10
    cvti2f f4, f4
    ; Calculamos 1/vIni * vMax y guardamos el resultado en f8
    multf f8, f22, f4
    ; Mientras tanto, calculamos vT y lo almacenamos en f3
    srli r9, r2, 2
    movi2fp f3, r9
    cvti2f f3, f3
    ; Calculamos la suma de los valores de la secuencia y la almacenamos en f1 para calcular el promedio
    movi2fp f1, r11
    cvti2f f1, f1
    
    
    
    ; Tenemos en f1 la suma de los valores de la secuencia, en f2 el valor inicial vIni, en f3 el tamaño de la secuencia vT y en f4 el valor máximo vMax
    ; Dividir el acumulador por el tamaño para obtener el promedio vMed
    divf f1, f1, f3 ; f1 = vMed
    ; Calculamos /vIni * vMax * vT y lo almacenamos en f12 
    multf f12, f8, f3
    lf f2 , secuencia+4
    ; Almacenar el tamaño de la secuencia en memoria
    sw secuencia_tamanho, r9
    cvti2f f2, f2
    ; Calculamos vIni * vT y lo almacenamos en f5
    multf f5, f2, f3   ; vIni * vT
    sf lista+20, f12
    
    ; Calculamos vMax * vT y lo almacenamos en f6
    multf f6, f4, f3   ; vMax * vT
    addf f20, f5, f12
    sf lista, f5
    
    

    ; Convertir valores enteros a punto flotante para las operaciones
    divf f14, f3, f4    ; vT/vMax
    sf lista+4, f6
    addf f20, f20, f6
    ; Calculamos 1/vIni * vMed * vT y lo almacenamos en f10
    multf f10, f22, f1
    ; Calculamos 1/vIni * vMed * vT y lo almacenamos en f10
    multf f10, f10, f3    
    
    multf f7, f1, f3   ; vMed * vT
    sf lista+28, f10
    addf f20, f20, f10
    
    divf f15, f3, f1   ; vT/vMed  
    multf f8, f2, f14  ; vIni * vT/vMax
    addf f20, f20, f7
    sf lista+8, f7 
    
    multf f13, f1, f14 ; vMed * vT/vMax
    sf lista+12, f8
    addf f20, f20, f8
    lf f21, nueve_inverso  ; Cargar el valor de 1/9 en f21
    multf f9, f2, f15  ; vIni * vT/vMed
    sf lista+32, f13
    addf f20, f20, f13
    
    multf f11, f4, f15 ; vMax * vT/vMed
    sf lista+16, f9
    addf f20, f20, f9
    addf f20, f20, f11
    
    

    multf f20, f20, f21 ; Multiplicar por 1/9
    sf lista+24, f11
    ; Almacenamos el maximo de la secuencia en memoria
    sw secuencia_maximo, r10
    sf secuencia_valor_medio, f1

    sf lista_valor_medio, f20  ; Almacena el valor medio de la lista en lista_valor_medio

    trap 0                     ; Termina el programa
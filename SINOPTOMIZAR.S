.data
valor_inicial: .word 97
secuencia: .space 120*4
secuencia_tamanho: .word 0
secuencia_maximo: .word 0
secuencia_valor_medio: .float 0.0
lista: .space 9*4
lista_valor_medio: .float 0.0

.text
.global main

main:
    lw r2, valor_inicial       ; Carga el valor inicial en el registro r2
    add r3, r0, r2             ; A[n-1]
    add r4, r0, r2             ; A[n]
    addi r5, r0, 3             ; Constante para multiplicar por 3
    addi r8, r0, secuencia     ; Carga la dirección de secuencia en r8
    sw 0(r8), r2               ; Almacena el valor inicial en la secuencia
    addi r9, r0, 0             ; Inicializa el contador de tamaño de secuencia en 0
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    add r10, r0, r2            ; Inicializa el valor máximo con el valor inicial
    add r11, r0, r2            ; Inicializa el acumulador para el valor medio con el valor inicial

loop:
    andi r7, r3, 1             ; Verifica si A[n-1] es impar
    bnez r7, odd               ; Si es impar, salta a la etiqueta 'odd'
    srli r4, r3, 1             ; Si es par, A[n] = A[n-1] / 2
    j continue_loop            ; Salta a continuar el bucle

odd:
    mult r4, r3, r5            ; Impar A[n] = 3 * A[n-1]
    addi r4, r4, 1             ; A[n] = A[n] + 1

continue_loop:
    add r3, r4, r0             ; Actualiza A[n-1] con el nuevo valor de A[n]
    sw 0(r8), r4               ; Almacena A[n] en la secuencia
    addi r9, r9, 1             ; Incrementa el contador de tamaño de secuencia
    addi r8, r8, 4             ; Incrementa la dirección de memoria para el siguiente término
    add r11, r11, r4           ; Suma A[n] al acumulador para el valor medio
    slt r12, r10, r4           ; Compara si el valor máximo es menor que A[n]
    bnez r12, update_max       ; Si es menor, actualiza el valor máximo
    subi r6, r4, 1             ; Resta 1 de A[n] y almacena el resultado en r6
    bnez r6, loop              ; Si A[n] no es 1, continúa el bucle
    addi r9, r9, 1             ; Incrementa el contador para el último valor (1)
    j calculate_average        ; Si A[n] es 1, salta a calcular el promedio

update_max:
    add r10, r0, r4            ; Actualiza el valor máximo con A[n]
    j loop                     ; Continúa el bucle

calculate_average:
    movi2fp f2, r11            ; Mueve el acumulador entero al registro FP
    movi2fp f4, r9             ; Mueve el contador de tamaño de secuencia al registro FP
    cvti2f f2, f2              ; Convierte el acumulador a punto flotante
    cvti2f f4, f4              ; Convierte el contador de tamaño de secuencia a punto flotante
    divf f2, f2, f4            ; Divide el acumulador por el tamaño para obtener el promedio
    sf secuencia_valor_medio, f2 ; Almacena el valor medio en secuencia_valor_medio
    sw secuencia_maximo, r10   ; Almacena el valor máximo en secuencia_maximo
    sw secuencia_tamanho, r9   ; Almacena el tamaño de la secuencia en secuencia_tamanho


    ; Cargar valores necesarios para la lista
    lw r2, valor_inicial
    lw r3, secuencia_tamanho
    lw r4, secuencia_maximo
    lf f0, secuencia_valor_medio

    ; Convertir valores enteros a punto flotante para las operaciones
    movi2fp f2, r2
    cvti2f f2, f2
    movi2fp f3, r3
    cvti2f f3, f3
    movi2fp f4, r4
    cvti2f f4, f4

    ; Realizar cálculos para la lista
    ; vIni * vT
    multf f5, f2, f3
    sf lista, f5

    ; vMax * vT
    multf f6, f4, f3
    sf lista+4, f6

    ; vMed * vT
    multf f7, f0, f3
    sf lista+8, f7

    ; (vIni/vMax) * vT
    divf f8, f2, f4
    multf f8, f8, f3
    sf lista+12, f8

    ; (vIni/vMed) * vT
    divf f9, f2, f0
    multf f9, f9, f3
    sf lista+16, f9

    ; (vMax/vIni) * vT
    divf f10, f4, f2
    multf f10, f10, f3
    sf lista+20, f10

    ; (vMax/vMed) * vT
    divf f11, f4, f0
    multf f11, f11, f3
    sf lista+24, f11

    ; (vMed/vIni) * vT
    divf f12, f0, f2
    multf f12, f12, f3
    sf lista+28, f12

    ; (vMed/vMax) * vT
    divf f13, f0, f4
    multf f13, f13, f3
    sf lista+32, f13

    ; Calcular el valor medio de los elementos de la lista
    addf f14, f5, f6
    addf f14, f14, f7
    addf f14, f14, f8
    addf f14, f14, f9
    addf f14, f14, f10
    addf f14, f14, f11
    addf f14, f14, f12
    addf f14, f14, f13
    ; Almacena el valor 9 en un registro R 
    addi r9, r0, 9
    ; Pasa el valor 9 a un registro FP
    movi2fp f15, r9
    cvti2f f15, f15

    divf f14, f14, f15          ; Divide la suma total por el tamaño de la secuencia
    sf lista_valor_medio, f14   ; Almacena el valor medio en lista_valor_medio

    trap 0                      ; Termina la ejecución del programa
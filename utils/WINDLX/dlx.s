.data
valor_inicial: .float 5
tamanho: .word 30
vector: .space 120
suma: .float 0

M: .float 0.0, 0.0
.float 0.0, 0.0
detM: .float 0.0
mediaM: .float 0.0

V: .float 0.0, 0.0
.float 0.0, 0.0
detV: .float 0.0
mediaV: .float 0.0
.text
.global main
main:

    lf      f0,             valor_inicial           ; f0=5.0
    lw      r8,             tamanho                 ; r8=30 pero se puede utilizar cualquier valor en rango de 10 a 30
    addi    r9,             r0,             0       ; inicializamos el puntero de posicion del vector
    addf    f5,             f5,             f1      ; se inicializa la suma a 0
    sf      vector(r9),     f1                      ; primera posicion del vector a 0 puesto que el primer valor d ela secuencia es 0
    addi    r9,             r9,             4       ; incrementamos el puntero del vector en 4 bytes puesto que es un float
    sf      vector(r9),     f0                      ; segunda posicion del vector a 5 ya que es el valor inicial, segundo elemento en la secuencia
    addi    r10,            r0,             5       ; inicializamos el contador de tamanho de la secuencia
    addf    f5,             f5,             f0      ; sumamos el valor inicial a la suma
    addi    r9,             r9,             4       ; incrementamos el puntero del vector en 4 bytes puesto que es un float
    addf    f18,            f0,             f1      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f18     ; sumamos el valor de la secuencia en n a la suma
    sf      vector(r9),     f18                     ; almacenamos en memoria el valor de la secuencia en vector[n]
    addi    r9,             r9,             4       ; incrementamos el puntero del vector en 4 bytes puesto que es un float
    addf    f19,            f18,            f0      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f19     ; sumamos el valor de la secuencia en n a la suma
    sf      vector(r9),     f19                     ; almacenamos en memoria el valor de la secuencia en vector[n]
    addi    r9,             r9,             4       ; incrementamos el puntero del vector en 4 bytes puesto que es un float
    addf    f20,            f19,            f18     ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f20     ; sumamos el valor de la secuencia en n a la suma
    sf      vector(r9),     f20                     ; almacenamos en memoria el valor de la secuencia en vector[n]

 
    addi    r10,            r10,            5       ; incrementamos el contador de la secuencia

    addi    r9,             r9,             20      ; incrementamos el puntero del vector


 
    lf      f2,             vector-24(r9)           ; cargamos el valor de la secuencia en n-2
    lf      f3,             vector-20(r9)           ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f4      ; sumamos el valor de la secuencia en n a la suma
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f8      ; sumamos el valor de la secuencia en n a la suma
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f11     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f14     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f17     ; sumamos el valor de la secuencia en n a la suma

    sf      vector(r9),     f17                     ; almacenamos en memoria



; notese que se deja para el final para aprovechar el tiempo de ejecucion del bucle
    sf      suma,           f5                      ; almacenamos la suma en memoria


    addi    r9,             r9,             20      ; incrementamos el puntero del vector


 
    lf      f2,             vector-24(r9)           ; cargamos el valor de la secuencia en n-2
    lf      f3,             vector-20(r9)           ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f4      ; sumamos el valor de la secuencia en n a la suma
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f8      ; sumamos el valor de la secuencia en n a la suma
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f11     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f14     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f17     ; sumamos el valor de la secuencia en n a la suma

    sf      vector(r9),     f17                     ; almacenamos en memoria



; notese que se deja para el final para aprovechar el tiempo de ejecucion del bucle
    sf      suma,           f5                      ; almacenamos la suma en memoria

    addi    r9,             r9,             20      ; incrementamos el puntero del vector


 
    lf      f2,             vector-24(r9)           ; cargamos el valor de la secuencia en n-2
    lf      f3,             vector-20(r9)           ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f4      ; sumamos el valor de la secuencia en n a la suma
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f8      ; sumamos el valor de la secuencia en n a la suma
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f11     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f14     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f17     ; sumamos el valor de la secuencia en n a la suma

    sf      vector(r9),     f17                     ; almacenamos en memoria



; notese que se deja para el final para aprovechar el tiempo de ejecucion del bucle
    sf      suma,           f5                      ; almacenamos la suma en memoria

    addi    r9,             r9,             20      ; incrementamos el puntero del vector


 
    lf      f2,             vector-24(r9)           ; cargamos el valor de la secuencia en n-2
    lf      f3,             vector-20(r9)           ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f4      ; sumamos el valor de la secuencia en n a la suma
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f8      ; sumamos el valor de la secuencia en n a la suma
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f11     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f14     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f17     ; sumamos el valor de la secuencia en n a la suma

    sf      vector(r9),     f17                     ; almacenamos en memoria



; notese que se deja para el final para aprovechar el tiempo de ejecucion del bucle
    sf      suma,           f5                      ; almacenamos la suma en memoria

    addi    r9,             r9,             20      ; incrementamos el puntero del vector


 
    lf      f2,             vector-24(r9)           ; cargamos el valor de la secuencia en n-2
    lf      f3,             vector-20(r9)           ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f4      ; sumamos el valor de la secuencia en n a la suma
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f8      ; sumamos el valor de la secuencia en n a la suma
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f11     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f14     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f17     ; sumamos el valor de la secuencia en n a la suma

    sf      vector(r9),     f17                     ; almacenamos en memoria



; notese que se deja para el final para aprovechar el tiempo de ejecucion del bucle
    sf      suma,           f5                      ; almacenamos la suma en memoria

    addi    r9,             r9,             20      ; incrementamos el puntero del vector


 
    lf      f2,             vector-24(r9)           ; cargamos el valor de la secuencia en n-2
    lf      f3,             vector-20(r9)           ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f4      ; sumamos el valor de la secuencia en n a la suma
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f8      ; sumamos el valor de la secuencia en n a la suma
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f11     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f14     ; sumamos el valor de la secuencia en n a la suma
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n
    addf    f5,             f5,             f17     ; sumamos el valor de la secuencia en n a la suma

    sf      vector(r9),     f17                     ; almacenamos en memoria



; notese que se deja para el final para aprovechar el tiempo de ejecucion del bucle
    sf      suma,           f5                      ; almacenamos la suma en memoria




 

   
     

 

fin:
    trap    0





opMat:
movf  f20,f3
sf    M, f3
movf  f21,f4
sf    M+4, f4
movf  f22,f8
sf    M+8, f8
movf  f23,f11
sf    M+12, f11
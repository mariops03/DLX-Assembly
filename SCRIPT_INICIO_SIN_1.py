def collatz_sequence_max_consecutive_evens(n):
    consecutive_evens = 0
    while n % 2 == 0:  # Mientras n sea par
        n = n // 2
        consecutive_evens += 1
        if n == 1:  # Si n es 1, detener el conteo
            return 0
    return consecutive_evens

def find_number_with_max_consecutive_evens(start, end):
    max_length = 0
    number_with_max_length = 0
    for i in range(start, end + 1, 2):  # Solo considerar números pares iniciales
        current_length = collatz_sequence_max_consecutive_evens(i)
        if current_length > max_length:
            max_length = current_length
            number_with_max_length = i
    return number_with_max_length, max_length

# Rango de números de 2 a 120, considerando solo números pares
start = 2
end = 120
number, length = find_number_with_max_consecutive_evens(start, end)
print(f"El número inicial par entre {start} y {end} que produce la mayor cantidad de números pares consecutivos en la secuencia de Collatz es {number}, con una longitud de {length}.")

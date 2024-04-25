def collatz_sequence_max_consecutive_evens(n):
    consecutive_evens = 0
    while n != 1:
        if n % 2 == 0:
            consecutive_evens += 1
            n = n // 2
        else:
            break  # Salimos del bucle si encontramos un número impar
    return consecutive_evens

def find_number_with_max_consecutive_evens(start, end):
    max_length = 0
    number_with_max_length = 0
    for i in range(start, end + 1, 2):  # Ajuste para iterar solo sobre números pares
        current_length = collatz_sequence_max_consecutive_evens(i)
        if current_length > max_length:
            max_length = current_length
            number_with_max_length = i
    return number_with_max_length, max_length

# Rango de números de 2 a 120, asegurándose de que el rango comience con un número par
start = 2 if 1 % 2 != 0 else 1
end = 120
number, length = find_number_with_max_consecutive_evens(start, end)
print(f"El número inicial par entre {start} y {end} que produce la mayor cantidad de pasos consecutivos de números pares en la secuencia de Collatz es {number}, con una longitud de {length}.")

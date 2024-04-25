def collatz_sequence(n):
    sequence = [n]
    while n != 1:
        if n % 2 == 0:
            n = n // 2
        else:
            n = 3 * n + 1
        sequence.append(n)
    return sequence

def count_consecutive_evens(sequence):
    max_length = 0
    current_length = 0
    for number in sequence:
        if number % 2 == 0:
            current_length += 1
        else:
            if current_length > max_length:
                max_length = current_length
            current_length = 0
    return max_length

# Número específico para calcular la secuencia de Collatz
number = 97
sequence = collatz_sequence(number)
max_consecutive_evens = count_consecutive_evens(sequence)

print(f"La secuencia de Collatz para el número {number} es:")
print(sequence)
print(f"El número máximo de pares consecutivos en la secuencia es: {max_consecutive_evens}")

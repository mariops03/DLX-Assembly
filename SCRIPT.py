def collatz_sequence(n):
    sequence = [n]
    while n != 1:
        if n % 2 == 0:
            n = n // 2
        else:
            n = 3 * n + 1
        sequence.append(n)
    return sequence

def find_max_consecutive_evens(start, end):
    max_length = 0
    number_with_max_length = 0
    for i in range(start, end + 1):
        sequence = collatz_sequence(i)
        consecutive_evens = 0
        for number in sequence:
            if number % 2 == 0:
                consecutive_evens += 1
            else:
                if consecutive_evens > max_length:
                    max_length = consecutive_evens
                    number_with_max_length = i
                consecutive_evens = 0
    return number_with_max_length, max_length

# Rango de números de 1 a 120
start = 1
end = 120
number, length = find_max_consecutive_evens(start, end)
print(f"El número inicial entre {start} y {end} que produce la mayor cantidad de números pares consecutivos en la secuencia de Collatz es {number}, con una longitud de {length}.")


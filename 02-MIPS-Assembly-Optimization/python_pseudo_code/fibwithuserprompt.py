def fibonacci(n):
    if n <= 1:
        return n
    a = 0
    b = 1
    for i in range(n - 1):
        temp = b
        b = a + b
        a = temp
    return b

# Test the function
n = int(input("Enter n: "))
result = fibonacci(n)
print(f"Fibonacci of {n} is {result}")

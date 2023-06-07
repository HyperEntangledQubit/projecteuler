#!/usr/bin/env julia

#=

Find the sum of the even Fibonacci numbers up to (but not including) 4_000_000

=#

"""
    rfibonacci(n)

# Description
Recursive method to calculate fibonacci numbers.

# Example
```jldoctest
julia> rfibonacci(25)
46368
```

# Warning
Works well for smaller values. Unknown behavior when values get too high.
Values that are too large will cause integer overflow (looks like integer
wrapping) and quite possibly stack overflow errors.

Need to either alter the stack size or create an iterative method to compute
large values of Fibonacci numbers.
"""
function rfibonacci(n)
    if n <= 0
        return 0
    elseif n == 1
        return 1
    else
        return rfibonacci(n-1) + rfibonacci(n-2)
    end
end


"""
    fibonacci(n)

# Description
Iterative method to calculate fibonacci numbers.

# Example
```jldoctest
julia> fibonacci(10_000)
2788724563990792802
```

# Warning
Able to calculate very large numbers. Better way to do this would be to store
already calculated values in a hashmap so don't have to spend time recalculating
them (use some kind of LRU algorithm).

Significantly large numbers will need a different type to prevent the integer
overflow from occurring.
"""
function fibonacci(n)
    if n <= 0
        return 0
    elseif n == 1
        return 1
    end

    prev = 0
    curr = 1
    result = 0

    for i in 1:n
        result = prev
        prev = curr
        curr = result + prev
    end

    return result
end

rfib = rfibonacci(35)
println("Check Fibonacci(35) is over 4_000_000 $rfib")

# Only need to calculate up to 34 to be within problem constraints
sum_even_fibonacci = 0

for i in 1:34
    fib = fibonacci(i)
    if fib > 4_000_000
        break
    end

    if fib % 2 == 0
        # Only need values under 4_000_000
        global sum_even_fibonacci += fib
        println("Fibonacci number $i is $fib")
    end
end

println("Sum of even Fibonacci values are under 4_000_000 is: $sum_even_fibonacci")


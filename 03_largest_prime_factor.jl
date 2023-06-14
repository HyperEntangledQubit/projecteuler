#!/usr/bin/env julia

#= Problem Statement

What is the largest prime factor of 60085147543?

TODO: Implement Pollard Rho method
TODO: Implement a multithreaded solution using Quadratic Sieve
=#

"""
    is_prime(n)

# Description
Primality test to find all prime numbers up to sqrt(n)

# Example
```jldoctest
julia> is_prime(7)
true
```

"""
function is_prime(n)
    if n <= 1
        return false
    end

    for i in 2:sqrt(n)
        if n % i == 0
            return false
        end
    end

    return true
end

"""
    gcd(x, y)

# Description
Recursive method to find the greatest common divisor of two numbers.

"""
function gcd(x, y)
    if x == 0
        return y
    end

    return gcd(y % x, x)
end

"""
    prime_factors(n)

# Description
Returns a list of prime factors using trial division.

Method searchs all prime values up to n

# Example
``` jldoctest
julia> prime_factor(5)
[1, 5]
```
# Warning
Large numbers method will eventually return the corect answer but, will take a
while. Utilize alternate algorithms to find large prime factorization
"""
function prime_factors(n)
    prime_factors = Int64[]
    for i in 1:trunc(Int64, sqrt(n))
        ggcd = gcd(i, n)
        if is_prime(i) && ggcd != 1
            push!(prime_factors, ggcd)
        end
    end

    return prime_factors
end

res = maximum(prime_factors(600851475143))
println("Largest prime factor of 600851475143 is $res")

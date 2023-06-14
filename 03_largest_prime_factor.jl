#!/usr/bin/env julia

using Primes

#= Problem Statement
#

What is the largest prime factor of 60085147543?

=#

"""
    isPrime(n)

# Description
Method to check if a given number is prime

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

    upper_bound = sqrt(n)
    for i in 2:upper_bound
        if n % i == 0
            return false
        end
    end

    return true
end

"""
    largest_prime_factor(n)

# Description
Iterative method to return largest prime factor of n

# Example
``` jldoctest
julia> largest_prime_factor(5)
5
```
# Warning
This method is slow... since we are using rather large numbers here.

TODO Redo this method using multithreading
"""
function largest_prime_factor(n)
    largest_prime = 0
    # Only need to check up to the sqrt of n
    for i in reverse(1:trunc(Int64, sqrt(n)))
        if is_prime(i)
            println(i)
        end
    end

    return largest_prime
end

res = largest_prime_factor(600851475143)
# res = is_prime(600851475143)
println("IS this value prime $res")
# println("Largest prime factor of 600851475143 is $res")

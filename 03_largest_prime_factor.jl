#!/usr/bin/env julia

#= Problem Statement
#

What is the largest prime factor of 60085147543?

=#

"""
    is_prime(n)

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

    for i in 2:sqrt(n)
        if n % i == 0
            return false
        end
    end

    return true
end

"""
"""
function gcd(x, y)
    if x == 0
        return y
    end

    return gcd(y % x, x)
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
    prime_factors = Int64[]
    # Only need to check up to the sqrt of n
    for i in 1:trunc(Int64, sqrt(n))
        if is_prime(i)
            ggcd = gcd(i, n)
            if ggcd != 1
                # println(ggcd)
                push!(prime_factors, ggcd)
            end
        end
    end

    return maximum(prime_factors)
end

res = largest_prime_factor(600851475143)
# res = is_prime(600851475143)
println("IS this value prime $res")
# println("Largest prime factor of 600851475143 is $res")

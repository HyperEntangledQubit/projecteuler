#!/usr/bin/env julia

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
    if n == 0
        return false
    end

    if n == 1 || n == 2
        return true
    end

    for i in 2:n-1
        if n % i == 0
            return false
        else
            return true
        end
    end
end

"""
    largest_prime_factor(n)

# Description
Finds all primes up to n then returns the largest prime factor

# Example
``` jldoctest
julia> largest_prime_factor(5)
5
```

"""
function largest_prime_factor(n)
    # Don't need this array here
    # Only need the largest out of the list so we can do a comparison here
    prime_factors = Int64[]
    for i in 1:n
        if is_prime(i)
            append!(prime_factors, i)
        end
    end

    return maximum(prime_factors)
end

res = largest_prime_factor(60085147543)

println("Largest prime factor of 6008517543 is $res")

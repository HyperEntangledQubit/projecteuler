#!/usr/bin/env julia

#= Problem Statement

Find the largest palindromic number made from the product of two 3-digit numbers
=#

"""
    is_palindrome(n)

# Description
Returns a bool if n is a palindromic number
"""
function is_palindrome(n)
    passed_in = string(n)

    # String should read the same way when reversed
    if passed_in == reverse(passed_in)
        return true
    end

    return false
end

# This is gross... Has to be a better way to do tbis
max = 0
for i in 1:999, j in 1:999
    result = is_palindrome(i * j)
    if result
        palindrome = i * j
        if palindrome >= max
            global max = palindrome
        end
    end
end

println("The largest two digit palindrome is $max")

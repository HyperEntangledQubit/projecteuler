#!/usr/bin/end julia

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

for i in 1:999
    result = is_palindrome(i)
    if result
        println("$i is a palindrome: $result")
    end
end


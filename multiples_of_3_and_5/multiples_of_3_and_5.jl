#!/usr/bin/env julia

#= Problem Statement

Find the sum of all natural numbers up to (but not including) 1000 that are
multiples of 3 or 5.

=#

result = 0
for i in 1:999 # Ranges in Julia are inclusive for the ending delimiter
    if i % 3 == 0 || i % 5 == 0
        global result += i
    end
end

println("Factors of 3 and 5 up to 1000 are $result")

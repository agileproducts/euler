#! /usr/bin/env ruby
# encoding: UTF-8

# S Cornelius 2013

# Project Euler problem 1:
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. 
# The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.


a = (1..999).inject(0) do |result, i|
  if (i % 3 == 0 or i % 5 == 0) then result+=i end
  result
end

puts a


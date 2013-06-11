#! /usr/bin/env ruby
# encoding: UTF-8

# S Cornelius 2013

# Project Euler problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

# At first I thought I'd make a sieve to generate primes then 
# factorise the number and compare each factor to the known prime list.
# That was very slow. Instead factorise the number and test if each is prime.

def simple_factorise(n)
  possible_factors = (2..n).to_a
  actual_factors = []
  possible_factors.each { |i| if n % i == 0 then actual_factors.push i end }
  actual_factors
end

def prime_factorise(n)
  possible_factors = (3..Math::sqrt(n).ceil).step(2).to_a #any odd number < root n could be a prime factor
  prime_factors = []
  if n.even? then prime_factors.push 2 end #if n is even 2 is a prime factor
  possible_factors.each do |i| 
    if n % i == 0 then 
      if isprime?(i) then prime_factors.push i end 
    end
  end
  prime_factors
end

# take all the numbers small than root n
# if any of them divide into n then it isn't prime
def isprime?(n)
  smaller_numbers = (2..Math::sqrt(n).ceil)
  smaller_numbers.each do |i|
    return true if n == 2
    return false if n % i == 0
  end
end


beginning = Time.now
#p simple_factorise(12)
p prime_factorise(600851475143)
puts "Time elapsed #{Time.now - beginning} seconds"
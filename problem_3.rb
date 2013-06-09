#! /usr/bin/env ruby
# encoding: UTF-8

# S Cornelius 2013

# Project Euler problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

# get a list of primes smaller than sqroot of this
# test whether each of them is a factor of the number

# generate list of primes using sieve of Eratosthenes

def primes_less_than_root(n) #too slow!! It isn't a correct sieve at all!
  u = Math::sqrt(n).floor
  integers = (2..u).to_a
  primes = integers
  primes.each do |p|
    primes.each do |i|
      if i > p && i % p == 0 then primes.delete(i) end
    end 
  end
  primes
end

def prime_factors(n) #
  possible_prime_factors = primes_less_than_root(n)
  prime_factors = []
  possible_prime_factors.each do |i|
    if n % i == 0 then prime_factors.push i end
  end
  prime_factors
end

# #http://stackoverflow.com/questions/241691/sieve-of-eratosthenes-in-ruby
def eratosthenes(n)
  possible_primes = (0..n).to_a
  possible_primes[0] = possible_primes[1] = nil
  possible_primes.each do |p|
    next unless p
    break if p * p > n
    (p*p).step(n, p) { |m| possible_primes[m] = nil }
  end
  possible_primes.compact
end

def prime_factors_e(n)
  u = Math::sqrt(n).floor
  primes = eratosthenes(n)
  prime_factors = []
  primes.each do |p|
    if n % p == 0 then prime_factors.push p end
  end
  prime_factors
end

beginning = Time.now
#puts prime_factors_e(851475144).inspect
#puts prime_factors(600851475143).inspect
puts "Time elapsed #{Time.now - beginning} seconds"
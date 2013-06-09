#! /usr/bin/env ruby
# encoding: UTF-8

# S Cornelius 2013

# Project Euler problem 2
# Find the sum of even-valued Fibonnaci numbers below 4 million
# Also containing some assorted Fibonacci stuff

# generate fib sequence - 0, 1, sum of previous two terms, sum of previous two terms, etc
def fibonacci(n) 
  sequence = [0,1]
  (1..n-2).each {|x| sequence.push(sequence[x] + sequence[x-1])}
  sequence
end

# a little example
a = fibonacci(10)
puts ""
puts "** A simple example **"
puts "The first ten numbers in the Fibonacci sequence are #{a.inspect}"
puts "---"

# generate sequence of fib numbers below 4 million
sequence = [0,1]
i = 1
until sequence[i] > 4000000
  sequence.push(sequence[i] + sequence[i-1])
  i+=1
end
sequence.pop

# find the sum of the even terms
sum_of_even_terms = sequence.inject(0) do |result, term|
  if term.even? then result+=term end
  result
end

puts "** Euler problem 2 **"
puts "The sum of all even terms in the Fibonacci series below 4 million is #{sum_of_even_terms}"
puts "---"


# An alternative to my Fib generator found by Googling
fib = Enumerator.new do |yielder|
  a = 0
  b = 1
  loop do
    yielder << a
    a, b = b, a + b
  end
end

#p fib.take(10) # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# find out whether a number is a Fibonnaci number
# true if 5N^2 + 4 or 5N^2 – 4 is a perfect square
# i.e. if either of those terms has an integer square root
# monkey patch on Numeric

class Numeric
  
  def fibonacci?
    if (Math::sqrt((5 * self**2) + 4) % 1 ==0) or (Math::sqrt((5 * self**2) - 4) % 1 ==0)
      return true 
    else 
      return false
    end
  end
  
end

puts "** Testing for Fibonacci numbers **"
puts "Is 8 a Fibonacci number? Computer says #{p 8.fibonacci?}"




  
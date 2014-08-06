require 'prime' # imports prime num methods
require_relative 'secret_function' # imports secret function black box
# to call secret function:
# secret(n)

puts "Please input integer"
n = gets.chomp.to_i

list_of_primes = Array.new
Prime.each(n) do |prime|
	list_of_primes << prime
end
# print list_of_primes
# 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 for primes less than 30
a = 0
@list_of_prime_combos = Array.new
while a < list_of_primes.length do
	puts "inside a loop#{a}"
	b = a + 1
	while b < list_of_primes.length do
		puts "inside b loop #{b}"
		@iteration = Array.new
		@iteration << list_of_primes[a]
		@iteration << list_of_primes[b]
		@list_of_prime_combos << @iteration
		b += 1
	end
	a += 1
end

print @list_of_prime_combos

# puts secret(n)
# puts secret(n+1)
# if secret(n) < secret(n+1)
# 	puts "This will always be bigger"
# else
# 	puts "you should not be seeing this. you done goofed"
# end
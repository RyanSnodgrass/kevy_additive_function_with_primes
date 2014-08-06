require 'prime' # imports prime num methods
require_relative 'secret_function' # imports secret function black box
# to call secret function:
# secret(n)
class FindsIfAdditive
	def initialize
		puts "Please input integer"
		@n = gets.chomp.to_i
	  puts "you want primes less than #{@n}"
	  find_primes_less_than(@n)
	  find_prime_combos
	end

	def find_primes_less_than(n)
		@list_of_primes = Array.new
		Prime.each(n) do |prime|
			@list_of_primes << prime
		end
		print @list_of_primes
	end

	def find_prime_combos
		a = 0
		@list_of_prime_combos = Array.new
		while a < @list_of_primes.length do
			b = a + 1
			while b < @list_of_primes.length do
				@iteration = Array.new
				@iteration << @list_of_primes[a]
				@iteration << @list_of_primes[b]
				@list_of_prime_combos << @iteration
				b += 1
			end
			a += 1
		end
		print @list_of_prime_combos
	end

end

FindsIfAdditive.new

# list_of_primes = Array.new
# Prime.each(n) do |prime|
# 	list_of_primes << prime
# end
# # print list_of_primes
# # 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 for primes less than 30

# def find_additive(x, y)
# #what do i want to do at this stage?
# # find if additive?
# 	# this will take secret(x+y) = secret(x) + secret(y)
# #whats left?
# #not much that i can find
# # i will create this method then insert into block down below
# 	secret(x)
# end
# a = 0
# @list_of_prime_combos = Array.new
# while a < list_of_primes.length do
# 	b = a + 1
# 	while b < list_of_primes.length do
# 		@iteration = Array.new
# 		@iteration << list_of_primes[a]
# 		@iteration << list_of_primes[b]
# 		@list_of_prime_combos << @iteration
# 		b += 1
# 	end
# 	a += 1
# end

# print @list_of_prime_combos

# # puts secret(n)
# # puts secret(n+1)
# # if secret(n) < secret(n+1)
# # 	puts "This will always be bigger"
# # else
# # 	puts "you should not be seeing this. you done goofed"
# # end
require 'prime' # imports prime num methods
require_relative 'secret_function' # imports secret function black box
# to call secret linear additive function:
# secret(n)

# to call secret function that will NOT be linear:
# not_secret(n)

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
		# print @list_of_primes
	end

	def find_if_additive(x, y)
			if secret(x+y) == secret(x) + secret(y)
				@additive = true
				# i need a method that will check all instances
				# and break program if any are false
			else
				# I'm back to finding a simple break method
				# ruby doesnt like the
				# break
				# method i keep trying to give it.
				@additive = false
					puts "this is NOT additive"
			end
	end

	def find_prime_combos
		a = 0
		@list_of_prime_combos = Array.new
		while a < @list_of_primes.length do
			b = a + 1
			until b == @list_of_primes.length do
				find_if_additive(@list_of_primes[a], @list_of_primes[b])
				b += 1
			end
			a += 1
		end
		puts "Hurray! We made it through the checker."
		puts "That means the secret function is Additive!"
		#print @list_of_prime_combos
	end

end

FindsIfAdditive.new
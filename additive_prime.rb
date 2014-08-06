require 'prime' # imports prime num methods
require_relative 'secret_function' # imports secret function black box
# to call secret linear additive function:
# secret(n)

# to call secret function that will NOT be linear:
# not_secret(n)

class FindsIfAdditive
	def initialize
		puts "Please input integer that primes will not exceed"
		@n = gets.chomp.to_i
		find_primes_less_than(@n)
		find_prime_combos
	end

	def find_primes_less_than(n)
		@list_of_primes = Array.new
		Prime.each(n) do |prime|
			@list_of_primes << prime
		end
	end

	def find_if_additive(x, y)
		unless secret(x+y) == secret(x) + secret(y)
			abort("The secret method is NOT additive")
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
		puts "That means the secret function is additive!"
	end

end

FindsIfAdditive.new
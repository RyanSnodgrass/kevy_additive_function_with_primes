require 'prime' # imports prime num methods
require_relative 'secret_function' # imports secret function black box
# to call secret linear additive function:
# secret(n)

# to call secret function that will NOT be linear additive:
# so_totally_not_secret(n)

class FindsIfAdditive
	# Upon creation class instance program first
	#   gets input from the terminal
	# Then runs the prime finder method
	# Then runs the method that checks for unique combos
	#   while checking if secret method is additive
	def initialize
		puts "Please input integer that primes will not exceed"
		@n = gets.chomp.to_i
		find_primes_less_than(@n)
		find_prime_combos
	end

	# Runs the Prime module and saves as array to var @list_of_primes
	def find_primes_less_than(n)
		puts "Finding primes less than #{@n}."
		@list_of_primes = Prime.each(n).to_a
		puts "Done"
	end

	# Compares if additive using two integers (from find_primes_combo)
	# As long as each check remains true, program continues 
	#   onto next check with next combo
	# Upon first false - program terminates and informs user
	def check_if_additive(x, y)
		unless secret(x+y) == secret(x) + secret(y)
			abort("The secret method is NOT additive.")
		end
	end

	# Finds combos of primes from @list_of_primes
	# To save time and memory, find_prime_combos only checks
	#   each unique combo once
	def find_prime_combos
		puts "Now checking whether the secret function is additive."
		a = 0
		while a < @list_of_primes.length do
			b = a + 1
			until b == @list_of_primes.length do
				check_if_additive(@list_of_primes[a], @list_of_primes[b])
				b += 1
			end
			a += 1
		end
		puts "Hurray! We made it through the checker."
		puts "That means the secret function is additive!"
	end
end

FindsIfAdditive.new
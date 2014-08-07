require 'prime' # imports prime num methods
require_relative 'secret_function' # imports secret function black box
# to call secret linear additive function:
# secret(n)

# to call secret function that will NOT be linear additive:
# so_totally_not_secret(n)

class FindsIfAdditive
	# Upon creation of class instance:
	#   First gets input from the terminal
	#   Checks that for integer presence
	#   Then runs the prime finder method
	#   Then runs the method that builds unique combos
	#   Finally tests combos for additive
	def initialize
		puts "Please input integer that primes will not exceed"
		print ">>"
		@n = Integer(gets.chomp) rescue nil
		check_integer_input
		find_primes_less_than(@n)
		find_prime_combos
		test_prime_combos_for_additive
	end

	# Performs simple check to make sure the user is inputting
	#   only integers
	def check_integer_input
		until @n != nil do
			puts "Please, just integers"
			print ">>"
			@n = Integer(gets.chomp) rescue nil
		end
	end

	# Runs the Prime module and saves as array to var @list_of_primes
	def find_primes_less_than(n)
		puts "Finding primes less than #{@n}."
		@list_of_primes = Prime.each(n).to_a
		puts "Done"
	end

	# Finds combinations of primes from @list_of_primes
	# Uses built-in ruby method .combination which finds
	#   all unique combos of an array
	def find_prime_combos
		puts "Finding all unique combinations of primes."
		@prime_combos = @list_of_primes.combination(2).to_a
		puts "Done"
	end

	# Compares if additive passing two int (from test_prime_combos_for_additive)
	# As long as each check remains true, program continues 
	#   onto next check with next combo
	# Upon first false - program informs user which prime combo failed
	#  and terminates
	def check_if_additive(x, y)
		unless secret(x+y) == secret(x) + secret(y)
			puts "Uh oh"
			puts "For Prime combo #{@iteration.join(" and ")}"
			abort("The secret method has been proven NOT additive.")
		end
	end

	# For each prime combo - runs check_if_additive
	# Passes in both values in the combo
	# Saves iteration for error message in check_if_additive
	# If all checks pass - success message displays and program terminates
	def test_prime_combos_for_additive
		puts "Now checking whether the secret function is additive."
		@prime_combos.each do |a|
			@iteration = a
			check_if_additive(a[0], a[1])
		end
		puts "Hurray! We made it through the checker."
		puts "That means for all primes less than #{@n}: the secret function has been proven additive!"
	end
end

FindsIfAdditive.new
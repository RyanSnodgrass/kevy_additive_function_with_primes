require 'prime' # imports prime num methods
require_relative 'secret_function' # imports secret function black box
# to call secret function:
# secret(n)

puts "Please input integer"
n = gets.chomp.to_i
puts n.class

puts secret(n)
puts secret(n+1)
if secret(n) < secret(n+1)
	puts "This will always be bigger"
else
	puts "you should not be seeing this. you done goofed"
end
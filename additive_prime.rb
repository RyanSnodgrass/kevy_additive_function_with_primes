require 'prime'
require_relative 'secret_function'

puts "Please input integer"
@N = gets.chomp.to_i
puts @N.class

area_51 = Secret.new(@N)
area_52 = Secret.new(@N+1)
puts area_51
puts area_51.secret
if area_51.secret < area_52.secret
	puts "this will always be bigger"
else
	puts "This should never show up. you done goofed"
end


# if Secret.new(@N) > Secret.new(4)
# 	puts "your value is larger than mine"
# else
# 	puts "mines bigger!"
# end
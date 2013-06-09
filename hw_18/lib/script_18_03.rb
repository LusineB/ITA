puts "================================================="
puts "Script\t\t" + __FILE__
puts "================================================="
puts "Description\t" + "First number divided by the second number"
puts "Name\t\t" +	"Lusine Petrosyan"
puts "Email\t\t" +	"bars.lucy@gmail.com"
puts"================================================="

require 'trollop'


opts = Trollop::options do
    opt :first, "first_number", :short => "-a", :type => :int 
    opt :second, "second_number", :short => "-b", :type => :int 
end


x = opts [:first].to_i
y = opts [:second].to_i

z = x / y

puts "When I divide #{x} by #{y} I always get #{z}!"
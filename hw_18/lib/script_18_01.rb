puts "================================================="
puts "Script\t\t" + __FILE__
puts "================================================="
puts "Description\t" + "Pass apple and banana as options"
puts "Name\t\t" +	"Lusine Petrosyan"
puts "Email\t\t" +	"bars.lucy@gmail.com"
puts"================================================="

require 'trollop'


opts = Trollop::options do
    opt :first, "first_fruit", :short => "-a", :type => :string 
    opt :second, "second_fruit", :short => "-b", :type => :string 
end

puts "My favorite fruites are #{ opts[:first]}s and #{ opts[:second]}s"

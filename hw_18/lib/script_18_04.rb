puts "================================================="
puts "Script\t\t" + __FILE__
puts "================================================="
puts "Description\t" + "Getting the IP address"
puts "Name\t\t" +	"Lusine Petrosyan"
puts "Email\t\t" +	"bars.lucy@gmail.com"
puts"================================================="

require 'trollop'


opts = Trollop::options do
    opt :first, "first_octet", :short => "-a", :type => :string 
    opt :second, "second_octet", :short => "-b", :type => :string 
	opt :third, "third_octet", :short => "-c", :type => :string 
    opt :fourth, "fourth_octet", :short => "-d", :type => :string 
end

ip=""
ip = ip + opts [:first] + '.' + opts [:second] + '.' + opts [:third] + '.' + opts [:fourth]

puts "My IP address is #{ip}"
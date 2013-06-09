puts "================================================="
puts "Script\t\t" + __FILE__
puts "================================================="
puts "Description\t" + "Average of any amount of numbers out of 10"
puts "Name\t\t" +	"Lusine Petrosyan"
puts "Email\t\t" +	"bars.lucy@gmail.com"
puts"================================================="

require 'trollop'

opts = Trollop::options do
    opt :first, "first_number", :short => "-a", :type => :int 	
    opt :second, "second_number", :short => "-b", :type => :int 
	opt :third, "third_number", :short => "-c", :type => :int 
    opt :fourth, "fourth_number", :short => "-d", :type => :int
	opt :fifth, "fifth_number", :short => "-e", :type => :int
	opt :sixth, "sixth_number", :short => "-f", :type => :int
	opt :seventh, "seventh_number", :short => "-g", :type => :int
	opt :eighth, "eighth_number", :short => "-h", :type => :int
	opt :ninth, "ninth_number", :short => "-i", :type => :int
	opt :tenth, "tenth_number", :short => "-j", :type => :int
end

num = []
i = 0

num [i] = opts [:first] 
i += 1
num [i] = opts [:second] 
i += 1
num [i] = opts [:third] 
i += 1
num [i] = opts [:fourth] 
i += 1
num [i] = opts [:fifth] 
i += 1
num [i] = opts [:sixth] 
i += 1
num [i] = opts [:seventh] 
i += 1
num [i] = opts [:eighth] 
i += 1
num [i] = opts [:ninth] 
i += 1
num [i] = opts [:tenth] 
i += 1


sum = 0
count = 0

num.each do |x|
sum += x.to_f
count += 1
end


average=sum / count

puts "Average score is #{average}"
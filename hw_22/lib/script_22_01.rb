puts "================================================="
puts "Script\t\t" + __FILE__
puts "================================================="
puts "Description\t" + "CSV file as an input through option"
puts "Name\t\t" +	"Lusine Petrosyan"
puts "Email\t\t" +	"bars.lucy@gmail.com"
puts"================================================="

require 'optparse'

OptionParser.new do |opts|

opts.on("-o") do
	$a = ARGV[0]
end

opts.on("-l") do
	$b = ARGV[0]
end

end.parse!

f = File.open($a, "r")
items_array = []

f.each_line {|line|
	items_array.push line.chomp
}

line_number = $b.to_i - 1

first = items_array[line_number].split(",")[0]
second = items_array[line_number].split(",")[1]

puts "My favorite fruits are #{first}s and #{second}s"
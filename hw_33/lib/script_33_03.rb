require 'optparse'

items_array = []

OptionParser.new do |opts|
	opts.on("-i", "--input") {$input_file = ARGV[0]}
	opts.on("-o", "--output") {$output_file = ARGV[0]}
end.parse!

f = File.open($input_file, "r")

f.each_line {|line| items_array.push line.chomp}

x = items_array[0].to_i
y = items_array[1].to_i

z = x / y

File.open($output_file, "w") do |write|

	write << "When I divide #{x} by #{y} I always get #{z}!"
end
require 'optparse'

items_array = []

OptionParser.new do |opts|
	opts.on("-i", "--input") {$input_file = ARGV[0]}
	opts.on("-o", "--output") {$output_file = ARGV[0]}
end.parse!

f = File.open($input_file, "r")

f.each_line {|line| items_array.push line.chomp}

File.open($output_file, "w") do |write|

	write << "My favorite fruits are #{items_array[0].chop} and #{items_array[1].chop}"
end
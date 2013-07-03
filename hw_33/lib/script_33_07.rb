require 'optparse'

items_array = []

OptionParser.new do |opts|
	opts.on("-i", "--input") {$input_file = ARGV[0]}
	opts.on("-o", "--output") {$output_file = ARGV[0]}
end.parse!

f = File.open($input_file, "r")

f.each_line {|line| items_array.push line.chomp}

reg=/[A-Z][a-z]+\s[A-Z][a-z]+/
name=items_array[0].match reg


File.open($output_file, "w") do |write|

	write << "His name is: \"#{name}\""
end
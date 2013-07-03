require 'optparse'

items_array = []

OptionParser.new do |opts|
	opts.on("-i", "--input") {$input_file = ARGV[0]}
	opts.on("-o", "--output") {$output_file = ARGV[0]}
end.parse!

f = File.open($input_file, "r")

f.each_line {|line| items_array.push line.chomp}

ip=""

items_array.each {|item| 
ip += item.chomp
ip += "."
}

ip = ip.chop


File.open($output_file, "w") do |write|

	write << "My IP address is #{ip}"
end
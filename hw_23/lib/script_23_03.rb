puts "================================================="
puts "Script\t\t" + __FILE__
puts "================================================="
puts "Description\t" + "JSON file as an input through option"
puts "Name\t\t" +	"Lusine Petrosyan"
puts "Email\t\t" +	"bars.lucy@gmail.com"
puts"================================================="

require 'optparse'
require 'json'

OptionParser.new do |opts|

opts.on("-o") do
	$a = ARGV[0]
end

end.parse!

items_array = []

json = File.read($a)
fruits = JSON.parse(json)

fruits.each do |number, name|
items_array.push name
end

x = items_array[0].chomp.to_i
y = items_array[1].chomp.to_i

z = x / y

puts "When I divide #{x} by #{y} I always get #{z}!"
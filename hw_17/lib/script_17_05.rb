puts "================================================="
puts "Script\t\t" + __FILE__
puts "================================================="
puts "Description\t" + "Average of five numbers"
puts "Name\t\t" +	"Lusine Petrosyan"
puts "Email\t\t" +	"bars.lucy@gmail.com"
puts"================================================="

require 'optparse'

OptionParser.new do |opts|

opts.on("-a", "--first_number") do
	$a = ARGV[0]
end

opts.on("-b", "--second_number") do
	$b = ARGV[0]
end

opts.on("-c", "--third_number") do
	$c = ARGV[0]
end

opts.on("-d", "--fourth_number") do
	$d = ARGV[0]
end

opts.on("-e", "--fifth_number") do
	$e = ARGV[0]
end

end.parse!

str =""
str += "(" + $a + ", " + $b + ", " + $c + ", " + $d + " and " + $e + ")"

sum = 0
sum +=$a.to_f + $b.to_f + $c.to_f + $d.to_f + $e.to_f

count = 5

average=sum / count

puts "Average score of #{str} is #{average}"
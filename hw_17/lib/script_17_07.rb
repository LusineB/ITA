puts "================================================="
puts "Script\t\t" + __FILE__
puts "================================================="
puts "Description\t" + "parsing a sentence"
puts "Name\t\t" +	"Lusine Petrosyan"
puts "Email\t\t" +	"bars.lucy@gmail.com"
puts"================================================="

require 'optparse'


OptionParser.new do |opts|

opts.on("-s", "--sentence") do
	#$str1 = ARGV[0]
end

end.parse!

str=""

ARGV.each do |i|
str+=i
str+=" "
end

reg=/[A-Z][a-z]+\s[A-Z][a-z]+/
name=str.match reg

puts "His name is: \"#{name}\""

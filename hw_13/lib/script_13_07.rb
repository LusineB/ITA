
str=""

ARGV.each do |i|
str+=i
str+=" "
end

reg=/[A-Z][a-z]+\s[A-Z][a-z]+/
name=str.match reg

puts "His name is: \"#{name}\""

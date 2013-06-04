
str=""
ARGV=ARGV.sort()

ARGV.each do |i|
str+=i
str+=" "
end

print "Here are sorted (alphabetically) words: #{str}"


ip=""

ARGV.each do |i|
ip+=i
ip+='.'
end

ip=ip.chop

puts "My IP address is #{ip}"

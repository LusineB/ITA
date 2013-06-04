if RUBY_PLATFORM =~ /32/  
then
	%x`ipconfig/all > ad.txt`
else
	 %x`ifconfig > ad.txt`
end

ipv6=/[\dA-Fa-f]{1,4}::([\dA-Fa-f]{1,4}(:[\dA-Fa-f]{1,4})+?%(\d{2}|\w{2}\d))/

if ARGV[0] == "ipv6_address"
then
	reg = ipv6
else
	reg = ""
end

text_file = File.read('ad.txt')
result = text_file.match reg

puts "IPv6 address of my computer: #{result}"
	
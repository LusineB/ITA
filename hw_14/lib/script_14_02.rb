if RUBY_PLATFORM =~ /32/  
then
	%x`ipconfig/all > ad.txt`
else
	 %x`ifconfig > ad.txt`
end

ipv4=/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/

if ARGV[0] == "ipv4_address"
then
	reg = ipv4
else
	reg = ""
end

text_file = File.read('ad.txt')
result = text_file.match reg

puts "IPv4 address of my computer: #{result}"
	
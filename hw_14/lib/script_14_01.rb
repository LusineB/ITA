if RUBY_PLATFORM =~ /32/  
then
	%x`ipconfig/all > ad.txt`
else
	 %x`ifconfig > ad.txt`
end

mac=/([0-9a-fA-F]{2}(-|:)){5}[0-9a-fA-F]{2}/

if ARGV[0] == "mac_address"
then
	reg = mac
else
	reg = ""
end

text_file = File.read('ad.txt')
result = text_file.match reg

puts "Mac address of my computer: #{result}"
	
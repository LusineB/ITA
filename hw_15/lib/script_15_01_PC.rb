if RUBY_PLATFORM =~ /32/  
then
	%x`ipconfig/all > ad.txt`
else
	 %x`ifconfig > ad.txt`
end

mask=/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/

if ARGV[0] == "subnet_mask"
then
	reg = mask
else
	reg = ""
end

text_file = File.read('ad.txt')
address = []
i = 0

text_file.scan (reg)  do |adr|
address[i] = adr
i += 1
end


puts "Subnet mask: #{address[1]}"
	
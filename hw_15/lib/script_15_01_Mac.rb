if RUBY_PLATFORM =~ /32/  
then
	%x`ipconfig/all > ad.txt`
else
	 %x`ifconfig > ad.txt`
end

mask=/[^(?:0x)]?([\da-fA-F]{8})/

if ARGV[0] == "subnet_mask"
then
	reg = mask
else
	reg = ""
end

text_file = File.read('ad.txt')
address = text_file.match reg


str = address.to_s

mask_dec=str.scan(/../).map {|i| i.to_i(16)}.join(".")
puts "Subnet mask: #{mask_dec}"
	
puts "================================================="
puts "Script\t\t" + __FILE__
puts "================================================="
puts "Description\t" + "Number of files in the Home directory"
puts "Name\t\t" +	"Lusine Petrosyan"
puts "Email\t\t" +	"bars.lucy@gmail.com"
puts"================================================="

if RUBY_PLATFORM =~ /32/
	then 
		%x'dir /s %HOMEPATH%  > list.txt'
else
		%x'cd $HOME; ls -la > list.txt'
end

sleep (10)

all=/\w+.\w{2,4}/
list = []

file = File.read('list.txt')

file.scan(all) do |item|
list << item
end

puts "My Home directory contains of #{list.size} files"





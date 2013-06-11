file1 = File.new('./etc/input.json', "w")

str1 = "{\n"
file1 << str1
i = 1

File.open('./etc/source.txt', "r").each_line do |line|

file = File.open('./etc/input.json', "a+")

number = i.to_s
str = "\t\"" + number + "\"\s:\s\"" + line.chomp + "\",\n"
file << str
i +=1

end

file = File.open('./etc/input.json', "a+")
str = "}"
file << str
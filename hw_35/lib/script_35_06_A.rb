require 'optparse'
require 'json'

str =  __FILE__
reg = /\/[\w\.]+$/
v = str.match reg
key =  v.to_s.reverse.chop.reverse

items_array = []

OptionParser.new do |opts|
	opts.on("-i", "--input") {$input_file = ARGV[0]}
	opts.on("-o", "--output") {$output_file = ARGV[0]}
end.parse!

json = File.read($input_file)
var = JSON.parse(json)

value =  var[key]

items_array = []

value.each do |a, b|
items_array.push b
end

sum = 0
count = 0

items_array.each {|item| 
sum += item.chomp.to_f
count += 1
}

average=sum / count


report = File.open($output_file, "w")
report << "<html><head><title>HW # 34</title></head><body bgcolor='#D4D0C8' leftmargin='0' rightmargin='0' topmargin='0' bottommargin='0' marginheight='0' marginwidth='0'>
<table bgcolor='#FFFFFF' width='100%' border='1' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#333333'>
<tr style='font-family:Verdana, Tahoma; color:0048B0; font-size:12pt;'><td>"

report << "#{key}: Average score is #{average}"

report << "</td></tr></table></body></html>"
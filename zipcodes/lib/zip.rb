require 'json'

report = File.new('./report/report.html', "w")
table = "<table border = 1 width = 150>"
report << table

report = File.open('./report/report.html', "a+")

json = File.read('./etc/input.json')
codes = JSON.parse(json)

codes.each do |x, zip|

row = "http://louis.therealreal.com/white_glove_requests/check_zip_code?zip_code="
url = row + zip
str = %x'curl --globoff #{url}'
reg = /true|false/
result1 = str.match reg
result = result1.to_s

if result == "true"
result = "pass"
else result = "fail"
end

html_string = "<tr><td>" + zip + "</td><td>" + result + "</td></tr>"
report << html_string

end

report << "</table>"
require 'optparse'
require 'mysql'

items = []

$table_name = "t_29"

OptionParser.new do |opts|
opts.on("-i", "--input") {$sql_file = ARGV[0]}
opts.on("-d", "--db") {$db_name = ARGV[0]}
opts.on("-c", "--test_case") {$test_case = ARGV[0]}
end.parse!

begin
con = Mysql.new 'localhost', 'auto', 'password'
con.query("CREATE DATABASE IF NOT EXISTS #{$db_name}")
con.query("USE #{$db_name}")
con.query("DROP TABLE IF EXISTS #{$table_name}")

File.readlines($sql_file).each do |sql| 					
str = sql.gsub("tbl","#{$table_name}") 					
con.query("#{str}") 												
end

rs = con.query("SELECT * FROM #{$table_name} WHERE TC = '#{$test_case}' ")
rs.each_hash do |line|
items << line["Item"].chomp
end

x = items[0].chomp.to_i
y = items[1].chomp.to_i

z = x / y

puts "When I divide #{x} by #{y} I always get #{z}!"


rescue Mysql::Error => e
puts e.errno
puts e.error
ensure
con.close if con
end

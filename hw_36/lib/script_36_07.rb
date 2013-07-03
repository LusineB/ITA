require 'optparse'
require 'mysql'
require 'csv'

items = []

OptionParser.new do |opts|
opts.on("-i", "--input") {$csv_file = ARGV[0]}
opts.on("-d", "--db") {$db_name = ARGV[0]}
opts.on("-t", "--table") {$table_name = ARGV[0]}
opts.on("-c", "--test_case") {$test_case = ARGV[0]}
opts.on("-o", "--output") {$output_table = ARGV[0]}
end.parse!


begin
con = Mysql.new 'localhost', 'auto', 'password'		# create a new connection
con.query("CREATE DATABASE IF NOT EXISTS #{$db_name}")
con.query("USE #{$db_name}")
con.query("DROP TABLE IF EXISTS #{$table_name}")
con.query("CREATE TABLE IF NOT EXISTS #{$table_name} (Id INT PRIMARY KEY AUTO_INCREMENT, Item VARCHAR(60), TC VARCHAR(10))")

tc = 1

f = CSV.read($csv_file)

f.each do |line|
line.each do |item|
  con.query("INSERT INTO #{$table_name}(Item, TC) VALUES('#{item}', 'c_#{tc}')")
  end
  tc += 1
  end
  

rs = con.query("SELECT * FROM #{$table_name} WHERE TC = '#{$test_case}' ")

con.query("DROP TABLE IF EXISTS #{$output_table}")
con.query("CREATE TABLE IF NOT EXISTS #{$output_table} (Id INT PRIMARY KEY AUTO_INCREMENT, Item VARCHAR(80))")

rs.each_hash do |row|
items << row["Item"].chomp
end

reg=/[A-Z][a-z]+\s[A-Z][a-z]+/
name=items[1].match reg

con.query("INSERT INTO #{$output_table}(Item) VALUES('His name is: \"#{name}\"')")


rescue Mysql::Error => e
puts e.errno
puts e.error
ensure
con.close if con
end


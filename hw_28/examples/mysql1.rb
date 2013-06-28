require 'mysql'

$db = 'TEST'
$table = 'QA'

begin
  con = Mysql.new 'localhost', 'auto', 'password'
  con.query("DROP DATABASE IF EXISTS #{$db}")
  con.query("CREATE DATABASE IF NOT EXISTS #{$db}")
  con.query("USE #{$db}")
  con.query("CREATE TABLE IF NOT EXISTS #{$table}(ID INT PRIMARY KEY AUTO_INCREMENT, TC_ID VARCHAR(10), TC_RESULT VARCHAR(10), TC_TIME datetime DEFAULT '0000-00-00 00:00:00')")

  puts '-----------------------------'

    pst = con.prepare"INSERT INTO #{$table}(TC_ID, TC_RESULT, TC_TIME) VALUES(?,?,?)"

    time_stamp = Time.now.to_s[0 .. 18]
    pst.execute "TC-0001", "PASS", time_stamp
    sleep (1)
    time_stamp = Time.now.to_s[0 .. 18]
    pst.execute "TC-0002", "PASS", time_stamp

    sleep (1)
    tc_one = 'TC-0003'
    tc_res = 'FAIL'
    tc_time_stamp = Time.now.to_s[0 .. 18]

  con.query"INSERT INTO #{$table}(TC_ID, TC_RESULT, TC_TIME) VALUES('#{tc_one}', '#{tc_res}', '#{tc_time_stamp}')"

  puts '-----------------------------'
  rs = con.query("SELECT * FROM #{$table};")

  fields = rs.fetch_fields
  puts "%3s | %5s \t| %5s | %5s" % [fields[0].name, fields[1].name, fields[2].name, fields[3].name]

rs.each_hash do |row|
   puts "%3d | %s \t| %s \t\t| %s" % [row['ID'], row['TC_ID'], row['TC_RESULT'], row['TC_TIME']]
  end


#  rs.each do |row|
#    puts row.join("\t\t")
#  end
  puts '-----------------------------'

rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end

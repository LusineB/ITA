require 'mysql'

begin
            puts "-----------------------------"
   con = Mysql.new '127.0.0.1', 'auto', 'password' #, 'ruby_test'
    #puts con.get_server_info
    rs = con.query 'SELECT VERSION()'
    puts rs.fetch_row    
            puts "-----------------------------"
            con.list_dbs.each do |db|
            puts db
    end
            puts "-----------------------------"
            
            con.query("use ruby_test")

    con.query("CREATE TABLE IF NOT EXISTS QA(Id INT PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(25))")
    con.query("INSERT INTO QA(Name) VALUES('Jack London')")
    con.query("INSERT INTO QA(Name) VALUES('Honore de Balzac')")
    con.query("INSERT INTO QA(Name) VALUES('Lion Feuchtwanger')")
    con.query("INSERT INTO QA(Name) VALUES('Emile Zola')")
    con.query("INSERT INTO QA(Name) VALUES('Truman Capote')") 
	
            puts "-----------------------------"
            rs_01 = con.query 'SHOW TABLES;'
    puts rs_01.fetch_row   
            puts "-----------------------------"
            rs_02 = con.query 'DESCRIBE qa'
    puts rs_02.fetch_row   
            puts "-----------------------------"
#          rs_03 = con.query 'SELECT * FROM qa;'
    puts con.query("SELECT * FROM qa;").fetch_row  
            puts "-----------------------------"
            puts con.query("SELECT * FROM qa;").num_rows
            puts "-----------------------------"
            rs_04 = con.query("SELECT * FROM qa;")
            #rs_04.each do |row|
   # puts row.join("\s")
            #end
            puts "-----------------------------"
    rs_04.each_hash do |row|
       puts row['Id'] + " " + row['Name'] + " -- " + row['Id']
    end 
            puts "-----------------------------"
            puts "---Multiple statements--------------------------"
            
            con.set_server_option Mysql::OPTION_MULTI_STATEMENTS_ON

    rs = con.query "SELECT Name FROM QA WHERE Id=1;
                    SELECT Name FROM QA WHERE Id=2;
                    SELECT Name FROM QA WHERE Id=3"

    puts rs.fetch_row        
            
    while con.next_result
        rs = con.store_result    
        puts rs.fetch_row
    end   
            puts "-----------------------------"
            puts "-----------------------------"
=begin
    rs = con.query "SELECT * FROM QA WHERE Id IN (1, 2, 3, 4, 5, 6)"
    puts "We have #{con.field_count} fields"
    puts "We have #{rs.num_rows} row(s)"
    puts rs.fetch_row.join("\s")
            
            puts "-----------------------------"
    con.query "DELETE FROM QA WHERE Id IN (1, 2, 3)"
    
    puts "The query has affected #{con.affected_rows} rows"
=end
            puts "-----------------------------"
    rs = con.query "SELECT * FROM QA WHERE Id=20"
    field = rs.fetch_field_direct 1
    
    puts "Table name: #{field.table}"
    puts "Field name: #{field.name}"
    puts "Field length: #{field.length}"
    puts "Field type: #{field.type}"
            puts "-----------------------------"
    rs = con.query "SELECT * FROM QA"
    
    fields = rs.fetch_fields    
    puts "%3s %s" % [fields[0].name, fields[1].name]
    
    rs.each_hash do |row|
        puts "%4s %s" % [row['Id'], row['Name']]
    end
            puts "-----------------------------"
            name = "Stefan Zweig"
            
            pst = con.prepare "INSERT INTO QA(Name) VALUES(?)"
    pst.execute name
            
            puts "-----------------------------"
            con.query("CREATE TABLE IF NOT EXISTS Images(Id INT PRIMARY KEY AUTO_INCREMENT, Data MEDIUMBLOB)")
            puts "-----------------------------"
    fin = File.open("new_ebay3.jpg" , "rb")
    img = fin.read
            
    pst = con.prepare("INSERT INTO Images SET Data='%s'" % img.unpack('H*'))
    pst.execute
            puts "-----------------------------"
    rs = con.query "SELECT Data FROM Images LIMIT 1"    
    f = File.new "new_ebay33.jpg", "wb"
    f.write rs.fetch_row.pack 'H*'
            puts "-----------------------------"
            puts "-----------------------------"
            rs_01 = con.query 'SHOW TABLES;'
    puts rs_01.fetch_row   
            puts "-----------------------------"
            rs_02 = con.query 'DESCRIBE Images'
    puts rs_02.fetch_row   
            puts "-----------------------------"
            
            puts "-----------------------------"
            
            con.autocommit false
    
    pst = con.prepare "UPDATE QA SET Name = ? WHERE Id = ?"
    pst.execute "Alex Khatilov", "224"
    pst.execute "Alex Khatilov", "225"

    con.commit
            puts "-----------------------------"
            
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end

require "selenium-webdriver"												# a tool to  drive a browser which allows us to interact with HTML of the application
require 'optparse'																# gem to parse command line options
require 'csv'																		# gem to parse csv files

OptionParser.new do |opts|
opts.on("-i", "--input") {$csv_file = ARGV[0]}						# read the first -i option in csv_file variable
opts.on("-o", "--output") {$txt_file = ARGV[0]}						# read the second -o option in txt_file variable
end.parse!

@driver = Selenium::WebDriver.for :firefox						# launch the Firefox browser 
@url = "http://www.google.com/advanced_search"			# assign the URL to @url variable
@driver.manage.timeouts.implicit_wait = 30						# apply 30 sec for each element on the page to be found

#@key = ARGV[0]			
#@expected_result = ARGV[1]

#@key ||= "QA"
#@expected_result ||= "1,130,000,000"

  def test_case(key, expected_result, output, line_number)
  
    @driver.get(@url)																								# get the URL to launch
    @driver.find_element(:name, "as_q").clear														# ckear the text field
	sleep (1)																												# hold the browser on for 1 sec
    @driver.find_element(:name, "as_q").send_keys key										# type the key word in the text field
	sleep (1)
    @driver.find_element(:xpath, "//input[@value='Advanced Search']").click		# click Advanced Search button
	sleep (1)

      @total = @driver.find_element(:id, "resultStats").text										# find the text on the page and store the value in @total
      
      @actual_result = @total[6 .. -1].gsub(/\,/,"").to_i.to_s.reverse.scan(/(?:\d*\.)?\d{1,3}-?/).join(',').reverse										# takes the string from the 6th character to the end, eliminate commas, leave only number part, convert to string, reverse, add commas after each 3 digits and reverse 

      expected_result = expected_result.to_s.reverse.scan(/(?:\d*\.)?\d{1,3}-?/).join(',').reverse if not expected_result.include?(',')	#  if no comma in the number, then add commas after each 3 digits
	  
	      
      if @actual_result == expected_result																																				# compare actual result with expected
      output << "For keyword \"#{key}\" - Test Case\##{line_number} is PASSED :: Expected Result: #{expected_result} MATCHES Actual Result: #{@actual_result}\n\n"	# output the result into txt file
      else
      output << "For keyword \"#{key}\" - Test Case\##{line_number} is FAILED :: Expected Result: #{expected_result} MISMATCHES Actual Result: #{@actual_result}\n\n" 
      end
	  
  end
  
  
#test_case(@key, @expected_result)

report = File.open($txt_file, "w")											# open file for writing

f = CSV.read($csv_file)														# parse csv file

f.each do |line|																		# read each line in csv file
	@key = line[1]																	# store the second entry in @key
	@expected_result = line[2]												# store the third entry in @expected_result
	test_case(@key, @expected_result, report, line[0])		# call test_case method
end

report.close																			# close output file

@driver.quit																		# close the browser

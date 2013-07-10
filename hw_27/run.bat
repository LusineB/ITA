:: Command to execute the test

:: call bundle exec ruby ./lib/static_element_validation.rb -d http://www.khatilov.com -o ./reports/v1_report.txt -p ./etc/test_specs/sign_up_01.json
call bundle exec ruby ./lib/static_element_validation.rb -d http://www.khatilov.com -o ./reports/v4_report.txt -p ./etc/test_specs/sign_up_04.json

pause
USERNAME = "George"
PASSWORD = "123456"
loop do
    puts "Please enter user name:"
    username_response = gets.chomp
    puts "Please enter your password:"
    password_response = gets.chomp
    break if username_response == USERNAME && password_response == PASSWORD
    puts "Authorization failed!"
end
puts "Welcome!"

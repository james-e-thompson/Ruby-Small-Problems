PASSWORD = "123456"
loop do
    puts "Please enter your password"
    input = gets.chomp
    break if input == PASSWORD
    puts "Invalid password!"
end
puts "Welcome!"

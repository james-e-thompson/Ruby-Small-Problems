loop do
    puts ">> Do you want me to print something? (y/n)"
    response = gets.chomp.downcase
    if response == 'y'
        puts "something"
        break
    elsif response == 'n'
        break
    else
        puts "Invalid input! Please enter y or n"
    end
end

choice = nil
loop do
    puts ">> Do you want me to print something? (y/n)"
    choice = gets.chomp.downcase
    break if %w(y n).include?(choice)
    puts "Invalid input! Please enter y or n"
end
puts "something" if choice == 'y'

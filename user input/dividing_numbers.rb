def valid_number?(number_string)
    number_string.to_i.to_s == number_string
end
numerator = nil
denominator = nil
loop do
    puts "Please enter the numerator:"
    numerator_input = gets.chomp
    if valid_number?(numerator_input)
        numerator = numerator_input.to_i
        break
    end
    puts "Invalid input. Only integers are allowed"
end
loop do
    puts "Please enter the denominator:"
    denominator_input = gets.chomp
    if !valid_number?(denominator_input)
        puts "Invalid input. Only integers are allowed."
    else
        denominator = denominator_input.to_i
        break if denominator != 0
        puts "Invalid input. A denominator of 0 is not allowed."
    end
end
puts "#{numerator}/#{denominator} is #{numerator/denominator}"

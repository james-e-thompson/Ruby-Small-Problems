def get_nonzero_number()
    loop do
        puts "Please enter a positive or negative integer:"
        first_input = gets.chomp
        return first_input.to_i if valid_number?(first_input)
        puts "Invalid input. Only nonzero integers are allowed"
    end
end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do
    first_input = get_nonzero_number
    second_input = get_nonzero_number
    # checks if one is positive and one is negative by seeing if their product is negative
    if first_input * second_input < 0
        puts "#{first_input} + #{second_input} = #{first_input + second_input}"
        break
    else
        puts "Sorry. One integer must be positive, one must be negative.\nPlease start over."
    end
end

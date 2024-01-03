loop do
    response = nil
    loop do
      puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit):'
      response = gets.chomp
      break if response.to_i >= 3 || response.downcase == "q"
      puts ">> That's not enough lines."
    end
    break if response.downcase == "q"
    response = response.to_i
    while response > 0
      puts 'Launch School is the best!'
      response -= 1
    end
end

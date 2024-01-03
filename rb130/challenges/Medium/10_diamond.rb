class Diamond
  def self.next_letter(letter)
    if ('A'..'Y').cover?(letter)
      (letter.ord + 1).chr
    else
      raise ArgumentError
    end
  end

  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    alphabet = ('A'..'Z').to_a
    current_letter = 'B'
    surrounding_spaces = alphabet.index(letter)
    diamond_lines = [' ' * surrounding_spaces + 'A' + ' ' * surrounding_spaces]
    inside_spaces = 1
    while current_letter <= letter
      surrounding_spaces -= 1
      line = ' ' * surrounding_spaces + current_letter + ' ' * inside_spaces + \
             current_letter + ' ' * surrounding_spaces
      diamond_lines << line
      current_letter = Diamond.next_letter(current_letter)
      inside_spaces += 2
    end
    remaining_lines = diamond_lines[...-1].reverse + ['']
    (diamond_lines + remaining_lines).join("\n")
  end
end

puts Diamond.make_diamond('B')
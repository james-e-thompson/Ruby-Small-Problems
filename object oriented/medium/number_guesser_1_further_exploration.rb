class Player
  MAX_GUESSES = 7

  attr_accessor :guesses_remaining

  def initialize
    reset
  end

  def obtain_one_guess
    loop do
      print "Enter a number between #{GuessingGame::RANGE.first}"\
            " and #{GuessingGame::RANGE.last}: "
      guess = gets.chomp.to_i
      return guess if GuessingGame::RANGE.cover?(guess)
      print "Invalid guess. "
    end
  end

  def display_guesses_remaining
    puts
    if guesses_remaining == 1
      puts 'You have 1 guess remaining.'
    else
      puts "You have #{guesses_remaining} guesses remaining."
    end
  end

  def reset
    self.guesses_remaining = MAX_GUESSES
  end

  def decrement_guesses
    self.guesses_remaining -= 1
  end

  def out_of_guesses
    guesses_remaining == 0
  end
end

class GuessingGame
  RANGE = 1..100

  RESULT_OF_GUESS_MESSAGE = {
    high:  "Your number is too high.",
    low:   "Your number is too low.",
    match: "That's the number!"
  }.freeze

  WIN_OR_LOSE = {
    high:  :lose,
    low:   :lose,
    match: :win
  }.freeze

  RESULT_OF_GAME_MESSAGE = {
    win:  "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze

  attr_reader :player

  def initialize
    @secret_number = nil
    @player = Player.new
  end

  def play
    reset
    game_result = play_game
    display_game_end_message(game_result)
  end

  private

  def reset
    @secret_number = rand(RANGE)
  end

  def play_game
    result = nil
    until player.out_of_guesses
      player.display_guesses_remaining
      result = check_guess(player.obtain_one_guess)
      puts RESULT_OF_GUESS_MESSAGE[result]
      break if result == :match
      player.decrement_guesses
    end
    WIN_OR_LOSE[result]
  end

  def check_guess(guess_value)
    return :match if guess_value == @secret_number
    return :low if guess_value < @secret_number
    :high
  end

  def display_game_end_message(result)
    puts "", RESULT_OF_GAME_MESSAGE[result]
  end
end

GuessingGame.new.play
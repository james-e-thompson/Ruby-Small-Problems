require 'minitest/autorun'
require_relative 'transaction.rb'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(10)
    sample_input = StringIO.new("5\n10\n")
    expected_output = <<-HEREDOC
You owe $10.
How much are you paying?
That is not the correct amount. Please make sure to pay the full cost.
You owe $10.
How much are you paying?
HEREDOC
    assert_equal(0, transaction.amount_paid)
    output = StringIO.new
    transaction.prompt_for_payment(input: sample_input, output: output)
    assert_equal(10, transaction.amount_paid)
  end
end
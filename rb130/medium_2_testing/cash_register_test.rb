require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(10)
  end

  def test_accept_money
    transaction = Transaction.new(0)
    transaction.amount_paid = 20
    assert_equal(10, @cash_register.total_money)
    @cash_register.accept_money(transaction)
    assert_equal 30, @cash_register.total_money
  end

  def test_change
    transaction = Transaction.new(58)
    transaction.amount_paid = 90
    assert_equal 90 - 58, @cash_register.change(transaction)
  end

  def test_give_receipt
    transaction = Transaction.new(58)
    assert_output("You've paid $58.\n") do
      @cash_register.give_receipt(transaction)
    end
  end
end
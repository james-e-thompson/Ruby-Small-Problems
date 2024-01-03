require 'set'

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval
    @stack = []
    @register = 0
    @program.split.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def push
    @stack.push(@register)
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def add
    old_register_value = @register
    @register = old_register_value + pop
  end

  def div
    old_register_value = @register
    @register = old_register_value - pop
  end

  def mod
    old_register_value = @register
    @register = old_register_value % pop
  end

  def mult
    old_register_value = @register
    @register = old_register_value * pop
  end

  def sub
    old_register_value = @register
    @register = old_register_value - pop
  end

  def print
    puts @register
  end
end
require 'set'

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval(arguments)
    @stack = []
    @register = 0
    if arguments
      @program_with_arguments = Kernel.format(@program, arguments)
    end
    @program_with_arguments.split.each { |token| eval_token(token) }
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
    @register += pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def mult
    @register *= pop
  end

  def sub
    @register -= pop
  end

  def print
    puts @register
  end
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40
FAHRENHEIT_TO_CENTIGRADE = '9 PUSH 32 PUSH %<degrees_f>d SUB PUSH 5 MULT DIV PRINT'
minilang = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)
minilang.eval(degrees_f: 212)
# 212
minilang.eval(degrees_f: 32)
# 32
minilang.eval(degrees_f: -40)
# -40
MPH_TO_KPH = '3 PUSH %<miles_per_hour>d DIV PUSH 5 MULT PRINT'
minilang = Minilang.new(MPH_TO_KPH)
minilang.eval(miles_per_hour: 6)
RECTANGLE_AREA = '%<length>d PUSH %<width>d MULT PRINT'
minilang = Minilang.new(RECTANGLE_AREA)
minilang.eval(length: 5, width: 3)
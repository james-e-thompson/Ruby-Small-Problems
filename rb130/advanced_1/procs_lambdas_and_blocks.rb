# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
#my_lambda.call
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
#block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin

We declare a proc through the method proc or Proc.new. We call a proc with
Proc#call, supplying its arguments. Unsupplied arguments are treated as nil.

A lambda is a special type of proc which we declare through the lambda method
or using special syntax. They are also called with call, but you have to supply
the right number of arguments.

Blocks are defined through curly braces after a method invocation, followed
by a list of parameters. They are called using yield within the method definition,
where arguments are supplied. Missing arguments are treated as nil.
=end
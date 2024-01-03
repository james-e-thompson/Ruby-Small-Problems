say_hello = 0

while say_hello < 5
    puts 'Hello!'
    say_hello += 1
end

say_hello = true
iterations = 0
while say_hello
    puts 'Hello!'
    iterations += 1
    if iterations >= 5
      say_hello = false
    end
end

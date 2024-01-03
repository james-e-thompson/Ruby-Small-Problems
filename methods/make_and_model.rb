# return value is nil
def car(make, model)
    puts make + ' ' + model
end

car('Toyota', 'Corolla')

# return value is a string
def car2(make, model)
    make + ' ' + model
end

puts car2('Toyota', 'Corolla')

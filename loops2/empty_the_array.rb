names = ['Sally', 'Joe', 'Lisa', 'Henry']
loop do
    puts names.delete(names.first)
    if names.empty?
        break
    end
end
names = ['Sally', 'Joe', 'Lisa', 'Henry']
loop do
    puts names.pop
    if names.empty?
        break
    end
end

daylight = [true, false].sample

def time_of_day(is_day)
    if is_day
        puts "It's daytime!"
    else
        puts "It's nighttime"
    end
end

time_of_day(daylight)

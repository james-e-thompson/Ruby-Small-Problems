class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = nil)
    if minute
      Clock.new(hour, minute)
    else
      Clock.new(hour, 0)
    end
  end

  def to_s
    hour_str = @hour.to_s
    hour_str = '0' + hour_str if hour_str.size == 1
    minute_str = @minute.to_s
    minute_str = '0' + minute_str if minute_str.size == 1
    "#{hour_str}:#{minute_str}"
  end

  def correct
    @hour += @minute / 60
    @minute %= 60
    @hour %= 24
  end

  def +(duration_in_minutes)
    resulting_time = Clock.new(hour, minute + duration_in_minutes)
    resulting_time.correct
    resulting_time
  end

  def -(duration_in_minutes)
    resulting_time = Clock.new(hour, minute - duration_in_minutes)
    resulting_time.correct
    resulting_time
  end

  def ==(other_clock)
    hour == other_clock.hour && minute == other_clock.minute
  end
  
  protected

  attr_reader :hour, :minute
end
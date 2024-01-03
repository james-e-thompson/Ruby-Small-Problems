class Meetup
  POSITION_INDICES = {'first' => 0, 'second' => 1, 'third' => 2, 'fourth' => 3,
                        'fifth' => 4, 'last' => -1}
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_week, position)
    correct_weekdays_in_month = []
    current_day = Date.civil(@year, @month, 1)
    while current_day.month == @month
      if current_day.wday == Date::DAYNAMES.index(day_of_week.capitalize)
        correct_weekdays_in_month << current_day
      end
      current_day = current_day.next_day
    end
    if position == 'teenth'
      correct_weekdays_in_month.find { |date| (13..19).cover?(date.day) }
    else
      correct_weekdays_in_month[POSITION_INDICES[position.downcase]]
    end
  end
end
class Robot
  attr_reader :name
  @@names_used = []

  def initialize
    assign_name
  end

  def reset
    @@names_used.delete(name)
    assign_name
  end

  def assign_name
    chosen_name = new_name
    @name = chosen_name
    @@names_used << chosen_name
  end

  def new_name
    candidate_name = ''
    loop do
      2.times do
        candidate_name << ('A'..'Z').to_a.sample
      end
      3.times do
        candidate_name << ('0'..'9').to_a.sample
      end
      break unless @@names_used.include?(candidate_name)
      candidate_name = ''
    end
    candidate_name
  end
end
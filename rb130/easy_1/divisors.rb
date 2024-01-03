def divisors(num)
  max_possible_proper_divisor = Math.sqrt(num.to_f).floor
  divisors = []
  (1..max_possible_proper_divisor).to_a.each do |candidate|
    if num % candidate == 0
      divisors << candidate
      divisors << num / candidate if candidate != num / candidate
    end
  end
  divisors.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
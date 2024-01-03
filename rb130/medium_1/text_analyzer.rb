class TextAnalyzer
  def process
    my_file = File.open("sample_text.txt")
    text = my_file.read
    result = yield(text)
    my_file.close
    result
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs." }
analyzer.process { |text| puts "#{text.lines.size } lines." }
analyzer.process { |text| puts "#{text.split.size } words." }
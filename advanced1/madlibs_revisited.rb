words_to_substitute = { adjective: %w(quick lazy sleepy ugly),
                        noun: %w(fox dog head leg),
                        verb: %w(jumps lifts bites licks),
                        adverb: %w(easily lazily noisily excitedly)
                      }
text = File.read("madlibs_text.txt")

text.split("\n").map do |line|
  substitutions = {}
  words_to_substitute.each do |word_class, words|
    substitutions[word_class] = words.sample
  end
  puts format(line, substitutions)
end
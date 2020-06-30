text = File.read("frankenstein.txt")
textarr = text.split(/\.|\?|!/)
puts textarr.max
largest_sentence = textarr.max_by { |sentence| sentence.split.size }
puts "#{largest_sentence}"


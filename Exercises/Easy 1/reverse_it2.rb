def reverse_sentence(string)
  reversed = []
  string.split.each do |word|
    if word.length >= 5
      reversed.push(word.reverse)
    else
      reversed.push(word)
    end
  end
  reversed.join(" ")
end

puts reverse_sentence('Walk around the block')
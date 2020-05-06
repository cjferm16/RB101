def letter_count(string)
  array = string.split
  hash = {}
  array.each do |word|
    word.delete!('^A-Za-z')
    if hash.has_key?(word.length) == false
      hash[word.length] = 1
    else
      hash[word.length] += 1
    end
  end
  p hash
end



letter_count('Four score and seven.')
letter_count('Hey diddle diddle, the cat and the fiddle!')
letter_count("What's up doc?")

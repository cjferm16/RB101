def ascii_value(string)
  value = 0
  string.each_char do |char|
    value += char.ord
  end
  p value
end

ascii_value('Four score')
ascii_value('Launch School')
ascii_value('a')
ascii_value('')


# Further exploration:

char.ord.mystery == char
char.ord.chr == char
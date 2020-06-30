NUMBS = { 'zero': '0', 'one': '1', 'two': '2', 'three': '3', 'four': '4',
          'five': '5', 'six': '6', 'seven': '7', 'eight': '8', 'nine': '9'}

def word_to_digit(string)
  newarr = []
  strarr = string.split(' ')

  strarr.each do |word|
    if NUMBS.include?(word.to_sym)
      newarr << NUMBS.values_at(word.to_sym)
    elsif word[-1] == '.' && NUMBS.include?(word[0...-1].to_sym)
      word[-1] = ''
      newarr << NUMBS.values_at(word.to_sym)[0] + '.'
    else
      newarr << word
    end
  end
  newarr.join(' ')
end
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
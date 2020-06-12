
def crunch(string)
  index = 0
  array = string.split('')
  newarr = 
  array.each do |letter|
    if array[index + 1] == letter
      array[index] = ''
      index += 1
    else
      index += 1
    end
  end
  newarr.join
end
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
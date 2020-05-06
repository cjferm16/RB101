def swap(string)
  new_string = []
  string.split(" ").map do |word| 
    temp_front = word[0]
    temp_back = word[-1]
    word[0] = temp_back
    word[-1] = temp_front
    new_string << word
  end
  p new_string.join(' ')
end


swap('What a wonderful world')
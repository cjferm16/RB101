def substrings(string)
  newarr = []
  until string.length == 0
    counter = 0
    loop do
      newarr << string[0..counter]
      counter += 1
      break if counter == string.length
    end
    string.delete_prefix!(string[0])
  end
  p newarr
end

substrings('abcde')

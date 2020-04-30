def short_long_short(str1, str2)
  if str1.length > str2.length
    puts str1 + str2 + str1
  else
    puts str2 + str1 + str2
  end
end

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

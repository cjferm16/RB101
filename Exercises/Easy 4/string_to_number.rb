def string_to_number(string)
  stringnums = string.chars
  integers = []
  if stringnums.first != '-'
    stringnums.each { |x| integers << string_case(x) }
    integers.inject {|sum, n| 10 * sum + n }
  else
    stringnums.delete('-')
    stringnums.each { |x| integers << string_case(x) }
    integers.inject {|sum, n| 10 * sum + n } * -1
  end
end


  def string_case(num)
    case num
    when '1'
      num = 1
    when '2'
      num = 2
    when '3'
      num = 3
    when '4'
      num = 4
    when '5'
      num = 5
    when '6'
      num = 6
    when '7'
      num =  7
    when '8'
      num = 8
    when '9'
      num = 9
    when '0'
      num = 0
    end
  end

  p string_to_number('-4321')
  p string_to_number('5384719')
  p string_to_number('-21')
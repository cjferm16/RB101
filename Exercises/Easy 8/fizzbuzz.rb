def fizzbuzz(num1, num2)
  (num1..num2).each do |num|
    if num % 3 == 0 && num % 5 == 0
      print "FizzBuzz "
    elsif num % 5 == 0
      print "Buzz "
    elsif num % 3 == 0
      print "Fizz "
    else
      print num.to_s + ' ' 
    end
  end
  puts ' '
end

fizzbuzz(1, 15)
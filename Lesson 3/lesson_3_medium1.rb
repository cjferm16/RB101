# QUESTION 1: Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

# For this practice problem, write a one-line program that creates the following 
# output 10 times, with the subsequent line indented 1 space to the right:

string = "The Flintstones Rock!"

10.times do puts string.prepend(" ") end
  
#----------------------------------------------------------------------#
# QUESTION 2: The result of the following statement will be an error:
puts "the value of 40 + 2 is " + (40 + 2) 

# One way to solve this is to use string interpolation like this
puts "the value of 40 + 2 is #{(40 + 2)}"

# Another way would be to convert the expression into a String.
puts "the value of 40 + 2 is " + (40 + 2).to_s 

#----------------------------------------------------------------------#
# QUESTION 3: Alan wrote the following method, which was 
# intended to show all of the factors of the input number:
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
# Alyssa noticed that this will fail if the input is 0, or a negative number, 
# and asked Alan to change the loop. How can you make this work without using 
# begin/end/until? Note that we're not looking to find the factors for 0 or 
# negative numbers, but we just want to handle it gracefully instead of raising 
# an exception or going into an infinite loop.

# We could use a while loop:
while divisor > 0
  puts "Divide by 0 not handled"

  # So it would look like:
  def factors(number)
    factors = []
    divisor  = number
    while divisor > 0 do
      factors << (number / divisor) if number % divisor == 0
      divisor -= 1
    end
    if divisor <= 0
      puts "Invalid number: no 0's or negatives!"
    else
    end
    factors
  end

  #----------------------------------------------------------------------#
  # QUESTION 4: Alyssa was asked to write an implementation of a rolling buffer. 
  # Elements are added to the rolling buffer and if the buffer becomes full, then 
  # new elements that are added will displace the oldest elements in the buffer.

  # She wrote two implementations saying, "Take your pick. Do you like << or + for 
  # modifying the buffer?". Is there a difference between the two, other than what 
  #operator she chose to use to add an element to the buffer?
  def rolling_buffer1(buffer, max_buffer_size, new_element)
    buffer << new_element
    buffer.shift if buffer.size > max_buffer_size
    buffer
  end
  
  def rolling_buffer2(input_array, max_buffer_size, new_element)
    buffer = input_array + [new_element]
    buffer.shift if buffer.size > max_buffer_size
    buffer
  end
  # The main difference between the two is that the first method mutates the buffer 
  # array, while the second method is a non-mutating expression to add elements
  # to the buffer array
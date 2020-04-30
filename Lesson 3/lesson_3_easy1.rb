#QUESTION 1: What would you expect the below code to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

=begin ANSWER: The below code would print 1 2 2 3 on separate lines.
This is because uniq method is non-mutating, and therefore the 'numbers'
variable is not changed.
=end

#----------------------------------------------------------------------#
#QUESTION 2: Describe the difference between '!' and '?' in Ruby. 
#And explain what would happen in the following scenarios:

what is != and where should you use it?
#!= is the 'not equal to' operator. Anything to the left of the 
#symbol is not equal to anything on the right

put ! before something, like !user_name
#This will return the opposite boolean for the expression given. Logical NOT operator

put ! after something, like words.uniq!
#This usually indicates that this is a mutating method and will change
#the original argument

put ? before something
#This usually indicates that the method we are calling is going to return
#a boolean value

put ? after something
#This indicates the ternary operator and begins a single line if/else statement

put !! before something, like !!user_name
#this is the negation operator written twice, it will 
#negate the argument, then negate the negation. Useful if you 
#want to return a true/false value that is not implictly returned by
#the given expression

#----------------------------------------------------------------------#
#QUESTION 3: Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."
p = advice.split(' ')
p.delete('important')
p.insert(6, 'urgent')
p.join!(' ')

#Below is provided solution -_-
advice.gsub!('important', 'urgent')

#----------------------------------------------------------------------#
#QUESTION 4: The Ruby Array class has several methods for removing items from the array. 
#Two of them have very similar names. Let's see how they differ:
numbers = [1, 2, 3, 4, 5]

# What do the following method calls do 
# (assume we reset numbers to the original array between method calls)?
numbers.delete_at(1)
numbers.delete(1)
#delete_at will delete the index 1 element within the array
#delete will delete the 1 element from the array.

#----------------------------------------------------------------------#
#QUESTION 5: Programmatically determine if 42 lies between 10 and 100.
array = (10..100)
array.each do |x|
  if x == 42
    return true
  else
  end
end

#another

(10..100).include?(42)

#----------------------------------------------------------------------#
#QUESTION 6: Starting with the string:
famous_words = "seven years ago..."
#show two different ways to put the expected "Four score and " in front of it.

def seven_years(string)
  p "Four score and " + string
end

famous_words.prepend("Four ", "score ", "and ")

#----------------------------------------------------------------------#
#QUESTION 7: If we build an array like this:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
#We will end up with this "nested" array:
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.
flintstones.flatten!

#----------------------------------------------------------------------#
#QUESTION 8: Given the hash below:
flintstones = { 
  "Fred" => 0, 
  "Wilma" => 1, 
  "Barney" => 2, 
  "Betty" => 3, 
  "BamBam" => 4, 
  "Pebbles" => 5 
}
#Turn this into an array containing only two elements: 
#Barney's name and Barney's number
flintstones.delete_if { |k, v| k != 'Barney'}
flintstones.to_a


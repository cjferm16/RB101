#1. Method that returns the sum of 2 integers
#Request input from user
#Assign a value to the operation
#return the value

#1. Formal Pseudocode
# START
# GET first_number
# GET second_number

# SET added_numbers = first_number+second_number

# PRINT added_numbers

# END


#2.a method that takes an array of strings, 
#and returns a string that is all those strings concatenated together 

#Get the array
#Iterate over array to ensure all values are strings
#if not, convert to strings
#Iterate again to add each value of each index together as strings



#2. Formal pseudocode
# START
# SET initial_array
# IF initial_array != strings
# SET new_array = initial_array.to_s

# SET concatenated_string = new_array.each
#   Create block to iterate through each new_array value and add together

# END


#3.  a method that takes an array of integers, 
#and returns a new array with every other element 

#Get the array
#Get index of each element
#Iterate over each index 
#If previous index was added to the new array, skip and add the next one
#Print the new array

#3. Formal pseudocode
# START
# SET integer_array
# SET counter
# SET other_array = integer_array.each
#   IF counter != integer_array.count
#   other_array pushed integer_array.index.odd?
#   CHANGE .odd? to .even? for even places.

# END
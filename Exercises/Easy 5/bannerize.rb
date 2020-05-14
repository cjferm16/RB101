def print_in_box(string)
  print "#{dashes(string.size)}"
  print "#{pipes(string.size)}"
  puts "| #{string} |"
  print "#{pipes(string.size)}"
  print "#{dashes(string.size)}"
end



def dashes(stringsize)
  if stringsize > 0 
    puts '+-'+('-' * stringsize)+'-+'
  else
    puts '+--+'
  end
end

def pipes(stringsize)
  if stringsize > 0
    puts "| " +(' ' * stringsize)+ ' |'
  else
    puts "|  |"
  end
end


print_in_box('hello there!')
print_in_box('To boldly go where no man has gone before')
print_in_box('')
def minilang(string)
  register = 0
  new_stack = []
  stack = string.split(' ')
  stack.map! do |val| 
    if val.to_i != 0
      val.to_i
    else
      val
    end
  end
  
  stack.each do |operation|
    if operation.is_a? Integer
      register = operation
    elsif operation == 'PUSH'
      new_stack.push(register)
    elsif operation == 'ADD'
      register += new_stack.pop
    elsif operation == 'SUB'
      register -= new_stack.pop
    elsif operation == 'MULT'
      register *= new_stack.pop
    elsif operation == 'DIV'
      register /= new_stack.pop
    elsif operation == 'MOD'
      register %= new_stack.pop
    elsif operation == 'POP'
      register = new_stack.pop
    else
      puts register
    end
  end
end


minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')

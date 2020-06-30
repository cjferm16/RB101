def balanced?(string)
  par_arr = string.scan(/[()]/)
  return false if par_arr.count('(') != par_arr.count(')') 
  return false if par_arr[0] == ')' || par_arr[-1] == '('
  return true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
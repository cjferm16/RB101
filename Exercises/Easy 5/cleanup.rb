
def cleanup(string)
  idx = 0
  newstr = string.gsub(/[\W]/, ' ').chars
  newstr = 
    newstr.each do |char|
      if newstr[idx] == ' ' && newstr[idx + 1] == ' '
        newstr[idx] = ''
        idx += 1
      else
        idx += 1
      end
    end
    newstr.join
end

p cleanup("---what's my +*& line?")
CONSONANTS = %w[b c d f g h j k l m n p q r s t v w x y z]

def double_consonants(string)
  arr1 = string.split('')
  arr2 = []
  arr1.each do |element|
    if CONSONANTS.include?(element.downcase)
      arr2 << element * 2
    else
      arr2 << element
    end
  end
  p arr2.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
array = (1..99).to_a

array.each do |x|
  if x.odd?
    puts x
  else
    next
  end
end

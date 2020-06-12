def diamond(int)
  whitespace = int/2
  oddarr = (1..int).to_a.select { |x| x.odd? }
  counter = 0
  if int == 1
    puts '*'
  elsif int > 1
    loop do
      puts ' ' * whitespace + '*' * oddarr[counter]
      whitespace -= 1
      counter += 1
      break if counter == oddarr.size
    end

    counter -= 1
    whitespace += 1

    loop do
      whitespace += 1
      counter -= 1
      puts ' ' * whitespace + '*' * oddarr[counter]
      break if counter == 0
    end

  end
end

diamond(9)

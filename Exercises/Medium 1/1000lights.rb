require 'pry'

def lights(num)
  lighthash = {}
  lightarray = []
  tempkey = 1
  num.times do 
    lighthash[tempkey] = 'ON'
    tempkey += 1
  end

  round = (1..num).to_a
  counter = 1

  loop do
    lighthash.each do |k, v|
      if k % round[counter] == 0 && v == 'ON'
        lighthash[k] = 'OFF'
      elsif k % round[counter] == 0 && v == 'OFF'
        lighthash[k] = 'ON'
      end
    end
    counter += 1
    break if counter == round.size
  end
  lightarray = lighthash.select { |k, v| v == 'ON' }.to_a
  p lightarray.flatten.select { |num| num if num.to_i > 0 }
end

lights(1000)
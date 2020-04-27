def aging(name = 'Teddy')
  age = Random.new
  puts "#{name} is #{age.rand(20..200)} years old!"
end

aging()
aging('Christian')
aging('Meghan')
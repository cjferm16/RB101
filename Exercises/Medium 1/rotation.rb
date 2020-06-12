# Part 1

def rotate_array(array)
  newarr = array.dup
  newarr << newarr.shift
  newarr
end

#--------------------------------------------#
# Part 2

def rotate_rightmost_digits(int, amount)
  if amount == 1
    int
  else
    newarr = int.to_s.split('').map { |num| num.to_i }
    p newarr << newarr.delete(newarr.last(amount)[0])
    newarr.join.to_i
  end
end

#--------------------------------------------#
# Part 3

def max_rotation(int)
max_rotate = int.to_s.chars.size

  loop do
    int = rotate_rightmost_digits(int, max_rotate)
    max_rotate -= 1
    break if max_rotate == 0
  end

int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845


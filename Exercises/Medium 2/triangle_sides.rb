def triangle(s1, s2, s3)
  case
  when s1 == s2 && s2 == s3 && s1 == s3
    return 'equilateral'.to_sym
  when (s1 == s2 || s2 == s3 || s1 == s3) && 
       (s1 != s2 || s2 != s3 || s1 != s3) && 
       (check_isosceles(s1, s2, s3))
    return 'isosceles'.to_sym
  when (s1 != s2) && (s2 != s3) && (s1 != s3)
    return 'scalene'.to_sym
  else
    return 'invalid'.to_sym
  end

end

def check_isosceles(s1, s2, s3)
  if s1 == 0 || s2 == 0 || s3 == 0 
    return false
  elsif (s1 == s2 && s1 > s3) || (s2 == s3 && s3 > s1) || (s1 == s3 && s1 > s2)
    return true
  else
    return false
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid
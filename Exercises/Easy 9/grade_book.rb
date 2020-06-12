def get_grade(int1, int2, int3)
  p numeric_score = (int1 + int2 + int3) / 3
  grade = 
    case
    when numeric_score >= 90 && numeric_score <= 100
      'A'
    when numeric_score >= 80 && numeric_score <= 90
      'B'
    when numeric_score <= 80 && numeric_score >= 70
      'C'
    when numeric_score <= 70 && numeric_score >= 60
      'D'
    when numeric_score < 60 && numeric_score >= 0
      'F'
    end
  grade
end


p get_grade(95, 90, 93)
p get_grade(50, 50, 95)
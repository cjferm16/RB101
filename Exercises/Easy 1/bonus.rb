def calculate_bonus(salary, boolean)
  bonus = nil
  if boolean
    bonus = salary / 2
  else
    bonus = 0
  end
  p bonus
end
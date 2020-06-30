ALPHA_UPPER = ('A'..'Z').to_a
ALPHA_LOWER = ('a'..'z').to_a

def letter_percentages(string)
  upper_count = 0
  lower_count = 0
  neither_count = 0
  case_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str_arr = string.chars

  str_arr.each do |char|
    if ALPHA_UPPER.include?(char)
      upper_count += 1
    elsif ALPHA_LOWER.include?(char)
      lower_count += 1
    else
      neither_count += 1
    end
  end

  case_hash[:lowercase] = (lower_count.to_f / string.size.to_f) * 100
  case_hash[:uppercase] = (upper_count.to_f / string.size.to_f) * 100
  case_hash[:neither] = (neither_count.to_f / string.size.to_f) * 100
  case_hash
end


p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
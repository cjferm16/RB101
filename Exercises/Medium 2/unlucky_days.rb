require 'date'

def friday_13th(year)
  start_date = Date.new(year, 01, 01)
  end_date =  Date.new(year, 12, 31)
  friday_arr = []
  (start_date..end_date).to_a.each do |date| 
    friday_arr << date if date.friday? && date.day == 13
  end
 friday_arr.size
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
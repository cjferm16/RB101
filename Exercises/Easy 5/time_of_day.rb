

Hour = 60
Min_in_Day = Hour * 24

def time_of_day (int)
  min_after_midnight = int % Min_in_Day
  hours_mins = min_after_midnight.divmod(Hour)
  
  "%.2d:%.2d" % hours_mins
  
end
=begin
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

=begin
Problem: Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.
  Rephrase: Given a string input in 24h time format, return the number of minutes before and after midnight, respectively.
Examples tests: 

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
before_midnight('23:57') == 3

INPUT: string 
OUTPUT: integer
Rules:
    Explicit: 
      - Time will be given in 24hr format
      - Must return 2 values from 2 separate methods
      - May not use Ruby's Date and Time methods
      - Value returned should be in the range of 0..1439
    Implicit:
      - Conversion to minutes
      - hour = 60 min
      - minutes_per_day = hour * 24
      - before_midnight = 

D:  input : string
    conversion -> array
    array element conversion -> integers
    integers -> minute conversion
    added together

Approach:
- Declare constants
- define before_midnight
    convert string to array
    convert array elements to integers
    convert first element to minute counterpart
    add both elements of array
    subtract total from minuter_per_day
    end
- define after_midnight
    convert string to array
    convert array elements to integers
    convert first element to minute counterpart
    add both elements of array
    end
C:
=end


HOUR = 60
MINUTES_PER_DAY = HOUR * 24

def minute_check(min)
    if minutes == 1440
    return 0
  else
    return minutes
  end
end


def before_midnight(string)
  time_array = string.split(':').map { |num| num.to_i }
  time_array[0] *= HOUR
  minutes = MINUTES_PER_DAY - time_array.sum
  minute_check(minutes)
end

def after_midnight(string)
  minutes = MINUTES_PER_DAY - (before_midnight(string))
  minute_check(minutes)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
p before_midnight('23:57') == 3


# Refactored option: 

def after_midnight(hours_string)
  hh, mm = hours_string.split(':').map(&:to_i)
  hh = 0 if hh == 24
  (hh * HOUR) + mm
end

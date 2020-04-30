def oddities(array)
  newarr = []
  array.each_index do |x|
    if x.even?
      newarr.push(array[x])
    else
      next
    end
  end
  p newarr
end

#First solve above, additional below

#Solves for the first further exploration:
def oddities2(array)
  newarr = []
  array.each_index do |x|
    if x.odd?
      newarr.push(array[x])
    else
      next
    end
  end
  p newarr
end

#trying an 'each' approach loop:
def oddities3(array)
  newarr=[]
  array.each do |x|
    if array.index(x).even?
      newarr.push(array[x])
    else
      next
    end
  end
  p newarr
end


oddities3([1,2,3,4,5,6])
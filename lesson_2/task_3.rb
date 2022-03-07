array = [0, 1]
loop do
  sum = array[-1] + array[-2]
  break if sum >= 100
  array << sum
end
p array

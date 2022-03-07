puts "Введите число"
number = gets.to_i
puts "Введите месяц"
month = gets.to_i
puts "Введите год"
year = gets.to_i

hash = {1=>31, 2=>28, 3=>31, 4=>30, 5=>31, 6=>30, 7=>31, 8=>31, 9=>30, 10=>31, 11=>30, 12=>31}
num = 0
num += number

hash.each do |key, value|
  if month > key && year % 100 == 0 && year % 400 == 0
    hash[2] = 29
    num += value
  elsif month > key && year % 4 == 0 && year % 100 != 0
    hash[2] = 29
    num += value
  elsif month > key
    num += value
  end
end

p num

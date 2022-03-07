hash = {}
sum = 0
loop do
puts "Введите название товара"
name = gets.chomp
break if name == "стоп"
puts "Введите цену товара"
price = gets.to_f
puts "Введите количество купленного товара"
number = gets.to_f

hash[name] = { price => number }
sum += price * number
end

hash.each do |key, value|
  array = value.to_a
  puts "цена за #{key} равна #{array[0][0] * array[0][1]}"
end
p hash
puts "Итоговая сумма всех покупок #{sum}"

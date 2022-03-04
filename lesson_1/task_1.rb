puts "Как вас зовут?"
name = gets.chomp
puts "Какой у вас рост?"
height = gets.to_i
weight = (height - 110) * 1.15
if weight.to_f <= 0
	puts "#{name}, ваш вес уже оптимальный"
else
	puts "#{name}, ваш идеальный вес #{weight}"
end

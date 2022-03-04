puts "Введите коэффициент a"
a = gets.to_f
puts "Введите коэффициент b"
b = gets.to_f
puts "Введите коэффициент c"
c = gets.to_f

d = b**2 - 4 * a * c

if d < 0
	puts "Корней нет"
elsif d == 0
	x = -b / (2 * a)
	puts "Корень квадратного уравнения равен #{x}"
else
	x_1 = (-b + Math.sqrt(d)) / (2 * a)
	x_2 = (-b - Math.sqrt(d)) / (2 * a)
	puts "Корни квадратного уравнения равны #{x_1} и #{x_2}"
end

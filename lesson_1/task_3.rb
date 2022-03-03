puts "Пожалуйста введите длину первой стороны треугольника"
a = gets.to_f
puts "Пожалуйста введите длину второй стороны треугольника"
b = gets.to_f
puts "Пожалуйста введите длину третьей стороны треугольника"
c = gets.to_f

if a > b && a > c && (a ** 2  == b ** 2 + c ** 2)
	triangle = true
elsif b > a && b > c && (b ** 2  == a ** 2 + c ** 2)
	triangle = true
elsif c > a && c > b && (c ** 2 == a ** 2 + b ** 2)
	triangle = true
end


if a == b && b == c
	puts "Треугольник равносторонний"
elsif (a == b || b == c || a == c) && triangle
	puts "Треугольник равнобедренный и прямоугольный"
elsif triangle
	puts "Треугольник прямоугольный"
elsif a == b || b == c || a == c
	puts "Треугольник равнобедренный"
else 
	puts "Треугольник обычный"
end


	
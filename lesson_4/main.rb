require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'pass_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'pass_carriage'
require_relative 'cargo_carriage'

station = {}
train = {}
route = {}

puts "Здравствуйте. Введите число соответствующее тому что вы хотите сделать.",
"0. Выйти",
"1. Создать станцию",
"2. Создать поезд",
"3. Создать маршрут",
"4. Добавить станцию в маршрут",
"5. Удалить станцию из маршрута",
"6. Назначить маршрут поезду",
"7. Добавить вагон поезду",
"8. Отцепить вагон от поезда",
"9. Переместить поезду по маршруту",
"10. Просмотреть список станций",
"11. Просмотреть список поездов на станции"

loop do
  input = gets.to_i
  case input
  when 0
    break
  when 1
    puts "Какое имя хотите задать станции?"
    name = gets.strip
    station[name] = Station.new(name)
    puts "Создана станция #{name}"
  when 2
    puts "Вы хотите создать пассажирский поезд или грузовой? Нажмите 1 если пассажирский или 2 если грузовой."
    a = gets.to_i
    puts "Введите номер поезда"
    if a == 1
      name = gets.strip
      train[name] = PassengerTrain.new(name)
    elsif a == 2
      name = gets.strip
      train[name] = CargoTrain.new(name)
    end
    puts "Создан поезд #{name}"
  when 3
    puts "Введите название маршрута"
    name_of_route = gets.strip
    puts "Введите имя первой станции на маршруте"
    name_first = gets.strip
    puts "Введите имя последней станции на маршруте"
    name_last = gets.strip
    route[name_of_route] = Route.new(station[name_first], station[name_last])
    puts "Создан маршрут #{name_of_route}"
  when 4
    puts "Введите имя станции которую хотите добавить"
    name_of_station = gets.strip
    puts "Введите название маршрута к которому вы хотите добавить эту станцию"
    name_of_route = gets.strip
    route[name_of_route].add_station(station[name_of_station])
  when 5
    puts "Введите имя станции которую хотите удалить"
    name_of_station = gets.strip
    puts "Введите название маршрута из которого вы хотите удалить эту станцию"
    name_of_route = gets.strip
    route[name_of_route].delete_station(station[name_of_station])
  when 6
    puts "Введите номер поезда которому вы хотите назначить маршрут"
    name = gets.strip
    puts "Введите название маршрута который вы хотите задать поезду"
    name_of_route = gets.strip
    train[name].add_route(route[name_of_route])
  when 7
    puts "К какому поезду вы хотите добавить вагон?"
    name = gets.strip
    if train[name].type == "passenger"
      carriage = PassengerCarriage.new
    else
      carriage = CargoCarriage.new
    end
    train[name].add_carriage(carriage)
  when 8
    puts "У какого поезда вы хотите отцепить вагон?"
    name = gets.strip
    train[name].delete_carriage(train[name].carriages.sample)
    puts "Отцеплен вагон от поезда #{name}"
  when 9
    puts "Какой поезд должен поехать?"
    name = gets.strip
    puts "Чтобы поезд проехал вперед нажмите 1, назад нажмите 2"
    a = gets.to_i
    if a == 1
      train[name].go_ahead
      puts "Поезд #{name} проехал вперед"
    elsif a == 2
      train[name].go_back
      puts "Поезд #{name} проехал назад"
    end
  when 10
    station.each_key { |key| puts key }
  when 11
    puts "На какой станции вы хотите посмотреть список поездов?"
    name = gets.strip
    if station[name].list_of_train.empty?
      puts "На станции нет поездов"
    else
      station[name].list_of_train.each { |train| puts train }
    end
  else
    puts "Неверный ввод, повторите снова"
  end
end

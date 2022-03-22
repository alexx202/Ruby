class Interface
  attr_accessor :station, :train, :route

  def initialize
    @station = {}
    @train = {}
    @route = {}
  end

  def show_interface
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
        make_station
      when 2
        made_train
      when 3
        made_route
      when 4
        add_station_to_route
      when 5
        delete_station_from_route
      when 6
        add_route_to_train
      when 7
        add_carriage
      when 8
        delete_carriage
      when 9
        move_train
      when 10
        show_list_of_station
      when 11
        show_list_of_train
      else
        puts "Неверный ввод, повторите снова"
      end
    end
  end

  private

  def make_station
    puts "Какое имя хотите задать станции?"
    name = gets.strip
    station[name] = Station.new(name)
    puts "Создана станция #{name}"
  end

  def made_train
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
  end

  def made_route
    puts "Введите название маршрута"
    name_of_route = gets.strip
    puts "Введите имя первой станции на маршруте"
    name_first = gets.strip
    puts "Введите имя последней станции на маршруте"
    name_last = gets.strip
    route[name_of_route] = Route.new(station[name_first], station[name_last])
    puts "Создан маршрут #{name_of_route}"
  end

  def add_station_to_route
    puts "Введите имя станции которую хотите добавить"
    name_of_station = gets.strip
    puts "Введите название маршрута к которому вы хотите добавить эту станцию"
    name_of_route = gets.strip
    route[name_of_route].add_station(station[name_of_station])
  end

  def delete_station_from_route
    puts "Введите имя станции которую хотите удалить"
    name_of_station = gets.strip
    puts "Введите название маршрута из которого вы хотите удалить эту станцию"
    name_of_route = gets.strip
    route[name_of_route].delete_station(station[name_of_station])
  end

  def add_route_to_train
    puts "Введите номер поезда которому вы хотите назначить маршрут"
    name = gets.strip
    puts "Введите название маршрута который вы хотите задать поезду"
    name_of_route = gets.strip
    train[name].add_route(route[name_of_route])
  end

  def add_carriage
    puts "К какому поезду вы хотите добавить вагон?"
    name = gets.strip
    if train[name].type == "passenger"
      carriage = PassengerCarriage.new
    else
      carriage = CargoCarriage.new
    end
    train[name].add_carriage(carriage)
  end

  def delete_carriage
    puts "У какого поезда вы хотите отцепить вагон?"
    name = gets.strip
    train[name].delete_carriage(train[name].carriages.sample)
    puts "Отцеплен вагон от поезда #{name}"
  end

  def move_train
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
  end

  def show_list_of_station
    station.each_key { |key| puts key }
  end

  def show_list_of_train
    puts "На какой станции вы хотите посмотреть список поездов?"
    name = gets.strip
    if station[name].list_of_train.empty?
      puts "На станции нет поездов"
    else
      station[name].list_of_train.each { |train| puts train }
    end
  end
end

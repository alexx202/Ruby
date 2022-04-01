# frozen_string_literal: true

class Interface
  attr_accessor :station, :train, :route, :carriages

  def initialize
    @station = {}
    @train = {}
    @route = {}
    @carriages = {}
  end

  # rubocop:disable Metrics
  def show_interface
    interface

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
      when 12
        made_carriage
      when 13
        show_carriages
      when 14
        add_in_carriage
      else
        puts 'Неверный ввод, повторите снова'
      end
    end
  end
  # rubocop:enable Metrics

  private

  # rubocop:disable Metrics/MethodLength:
  def interface
    puts 'Здравствуйте. Введите число соответствующее тому что вы хотите сделать.',
         '0. Выйти',
         '1. Создать станцию',
         '2. Создать поезд',
         '3. Создать маршрут',
         '4. Добавить станцию в маршрут',
         '5. Удалить станцию из маршрута',
         '6. Назначить маршрут поезду',
         '7. Добавить вагон поезду',
         '8. Отцепить вагон от поезда',
         '9. Переместить поезду по маршруту',
         '10. Просмотреть список станций',
         '11. Просмотреть список поездов на станции',
         '12. Создать вагон',
         '13. Просмотреть список вагонов у поезда',
         '14. Занять место или обьем в вагоне'
  end

  # rubocop:enable Metrics/MethodLength:
  def make_station
    puts 'Какое имя хотите задать станции?'
    name = gets.strip
    station[name] = Station.new(name)
    puts "Создана станция #{name}"
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def made_train
    puts 'Вы хотите создать пассажирский поезд или грузовой? Нажмите 1 если пассажирский или 2 если грузовой.'
    input = gets.to_i
    puts 'Введите номер поезда'
    input == 1 ? made_passenger_train : made_cargo_train
    puts "Создан поезд #{name}"
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def made_cargo_train
    name = gets.strip
    train[name] = PassengerTrain.new(name)
  end

  def made_passenger_train
    name = gets.strip
    train[name] = CargoTrain.new(name)
  end

  def made_route
    puts 'Введите название маршрута'
    name_of_route = gets.strip
    puts 'Введите имя первой станции на маршруте'
    name_first = gets.strip
    puts 'Введите имя последней станции на маршруте'
    name_last = gets.strip
    route[name_of_route] = Route.new(station[name_first], station[name_last])
    puts "Создан маршрут #{name_of_route}"
  end

  def add_station_to_route
    puts 'Введите имя станции которую хотите добавить'
    name_of_station = gets.strip
    puts 'Введите название маршрута к которому вы хотите добавить эту станцию'
    name_of_route = gets.strip
    route[name_of_route].add_station(station[name_of_station])
  end

  def delete_station_from_route
    puts 'Введите имя станции которую хотите удалить'
    name_of_station = gets.strip
    puts 'Введите название маршрута из которого вы хотите удалить эту станцию'
    name_of_route = gets.strip
    route[name_of_route].delete_station(station[name_of_station])
  end

  def add_route_to_train
    puts 'Введите номер поезда которому вы хотите назначить маршрут'
    name = gets.strip
    puts 'Введите название маршрута который вы хотите задать поезду'
    name_of_route = gets.strip
    train[name].add_route(route[name_of_route])
  end

  def add_carriage
    puts 'К какому поезду вы хотите прицепить вагон?'
    name = gets.strip
    puts 'Напишите номер вагона который вы хотите прицепить.'
    number = gets.to_i
    train[name].add_carriage(carriages[number])
    puts "Добавлен вагон к поезду #{name}"
  end

  def delete_carriage
    puts 'У какого поезда вы хотите отцепить вагон?'
    name = gets.strip
    puts 'Какой вагон вы хотите отцепить?'
    number = gets.to_i
    train[name].delete_carriage(carriages[number])
    puts "Отцеплен вагон от поезда #{name}"
  end

  def move_train
    puts 'Какой поезд должен поехать?'
    name = gets.strip
    puts 'Чтобы поезд проехал вперед нажмите 1, назад нажмите 2'
    a = gets.to_i
    a == 1 ? train_go_ahead(name) : train_go_back(name)
  end

  def train_go_ahead(name)
    train[name].go_ahead
    puts "Поезд #{name} проехал вперед"
  end

  def train_go_back(name)
    train[name].go_back
    puts "Поезд #{name} проехал назад"
  end

  def show_list_of_station
    station.each_key { |key| puts key }
  end

  def show_list_of_train
    puts 'На какой станции вы хотите посмотреть список поездов?'
    name = gets.strip
    if station[name].list_of_train.empty?
      puts 'На станции нет поездов'
    else
      station[name].each_train do |train|
        puts "Имя поезда: #{train.name}, тип: #{train.type}, количество вагонов: #{train.carriages.size}"
      end
    end
  end

  def made_carriage
    puts 'Нажмите 1 чтобы создать пассажирский вагон или 2 чтобы создать грузовой вагон'
    input = gets.to_i
    input == 1 ? create_pass_carriage : create_cargo_carriage
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_pass_carriage
    puts 'Сколько мест должно быть в вагоне?'
    seats = gets.to_i
    puts 'Введите номер вагона'
    number = gets.to_i
    carriages[number] = PassengerCarriage.new(number_of_seats: seats, number_of_carriage: number)
    puts "Создан вагон с количеством мест: #{seats}"
  end

  def create_cargo_carriage
    puts 'Какой общий объем должен быть у вагона?'
    capacity = gets.to_i
    puts 'Введите номер вагона'
    number = gets.to_i
    carriages[number] = CargoCarriage.new(capacity: capacity, number_of_carriage: number)
    puts "Создан вагон с объемом #{capacity}"
  end

  def show_carriages
    puts 'У какого поезда вы хотите посмотреть список вагонов?'
    name = gets.strip
    train[name].each_carriage do |carriage|
      puts "Номер вагона: #{carriage.number_of_carriage}, тип: #{carriage.type}."
      carriage.type == :passenger ? show_pass_carriage : show_cargo_carriage
    end
  end

  def show_pass_carriage
    puts "Количество свободных мест: #{carriage.number_of_empty_seats} ",
         "количество занятых мест: #{carriage.number_of_busy_seats}"
  end

  def show_cargo_carriage
    puts "Количество свободного объема: #{carriage.empty_capacity} ",
         "количество занятого объема #{carriage.busy.capacity}"
  end

  def add_in_carriage
    puts 'Введите номер вагона'
    number = gets.to_i
    if carriages[number].type == :passenger
      carriages[number].take_seat
      puts 'Вы заняли место в вагоне.'
    else
      puts 'Введите обьем который хотите занять.'
      capacity = gets.to_i
      carriages[number].load_cargo(capacity)
    end
  end
end

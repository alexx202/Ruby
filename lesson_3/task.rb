class Station

  attr_reader :name, :list_of_train

  def initialize(name)
    @name = name
    @list_of_train = []
  end

  def take_train(train)
    list_of_train << train
  end

  def send_train(train)
    list_of_train.delete(train)
  end

  def show_type_of_trains
    list_of_train.each { |train| puts "#{train.name}: #{train.type}" }
  end
end

class Route

  attr_reader :list_of_station

  def initialize(first_station, last_station)
    @list_of_station = [first_station, last_station]
  end

  def add_station(station)
    list_of_station.insert(-2, station)
  end

  def delete_station(station)
    list_of_station.delete(station)
  end

  def show_route
    list_of_station.each_with_index { |station, number| puts "Станция #{number + 1}: #{station}" }
  end
end

class Train

  attr_accessor :speed, :route_of_train, :location
  attr_reader :name, :type, :number_of_carriages

  def initialize(name, type, number_of_carriages)
    @name = name
    @type = type
    @number_of_carriages = number_of_carriages
  end

  def stop
    @speed = 0
  end

  def add_carriage
    self.number_of_carriages += 1 if self.speed == 0
  end

  def delete_carriage
    self.number_of_carriages -= 1 if self.speed == 0
  end

  def add_route(route)
    self.route_of_train = route.list_of_station
    route.list_of_station[0].take_train(self)
    self.location = route.list_of_station[0]
  end

  def location=(station)
    @location = station
  end

  def go_ahead
    route_of_train[route_of_train.index(location) + 1].take_train(self)
    self.location = route_of_train[route_of_train.index(location) + 1]
    self.location.send_train(self)
  end

  def go_back
    route_of_train[route_of_train.index(location) - 1].take_train(self)
    self.location = route_of_train[route_of_train.index(location) - 1]
    self.location.send_train(self)
  end

  def show_around_station
    puts "Следующая станция: #{route_of_train[route_of_train.index(location) + 1]}"
    puts "Текущая станция: #{self.location}"
    puts "Прошлая станция: #{route_of_train[route_of_train.index(location) - 1]}"
  end
end

st1 = Station.new("1")
st2 = Station.new("8")
st3 = Station.new("14")
st4 = Station.new("66")
st5 = Station.new("77")

route1 = Route.new(st1, st5)
route1.add_station(st2)
route1.add_station(st3)
route1.add_station(st4)
route1.delete_station(st3)
route1.show_route
p route1.list_of_station

train1 = Train.new("222", "passenger", 8)
train2 = Train.new("333", "freight", 80)
train3 = Train.new("444", "passenger", 0)

puts train1.speed = 50
puts train1.stop
train1.add_route(route1)
puts "-" * 60
train1.go_ahead
puts train1.location
puts "-" * 60
train1.go_ahead
puts train1.location
puts "-" * 60
train1.go_back
puts train1.location
puts "-" * 60
train1.show_around_station

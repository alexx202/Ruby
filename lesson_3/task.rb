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

  def type_of_trains(type)
    list_of_train.select { |train| train.type == type }
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
  attr_accessor :speed, :route_of_train, :location, :number_of_carriages
  attr_reader :name, :type

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
    self.route_of_train = route
    self.location = 0
    current_station.take_train(self)
  end

  def go_ahead
    current_station.send_train(self)
    next_station.take_train(self)
    self.location += 1
  end

  def go_back
    current_station.send_train(self)
    previous_station.take_train(self)
    self.location -= 1
  end

  def previous_station
    route_of_train.list_of_station[location - 1]
  end

  def current_station
    route_of_train.list_of_station[location]
  end

  def next_station
    route_of_train.list_of_station[location + 1]
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
train1.add_carriage
puts train1.number_of_carriages
train1.add_carriage
puts train1.number_of_carriages
train1.delete_carriage
puts train1.number_of_carriages
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
puts "=" * 60
puts train1.current_station
puts train1.next_station
puts train1.previous_station
puts "=" * 60
train2.add_route(route1)
puts train2.location
puts "-" * 60
train3.add_route(route1)
puts st1.type_of_trains("passenger")
puts st1.type_of_trains("freight")

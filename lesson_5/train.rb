class Train
  attr_reader :name, :carriages, :route_of_train, :type, :location, :speed

  include Company
  include InstanceCounter

  @@trains = {}

  class << self

    def trains
      @@trains
    end

    def find(name)
      @@trains[name] if @@trains.include?(name)
    end
  end

  def stop
    @speed = 0
  end

  def speed_up(speed)
    @speed = speed
  end

  def add_carriage(carriage)
    carriages << carriage if self.speed == 0 && carriage.type == self.type
  end

  def delete_carriage(carriage)
    carriages.delete(carriage) if self.speed == 0 && carriage.type == self.type
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

  protected# методы вынесены в protected так как они нужны в подклассах
  attr_writer :carriages, :route_of_train, :location, :speed

  def initialize(name)
    @name = name
    @speed = 0
    @carriages = []
    @@trains[name] = self
    self.class.create_count
    register_instance
  end
end

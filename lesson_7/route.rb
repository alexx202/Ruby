class Route
  attr_reader :list_of_station

  include InstanceCounter

  def initialize(first_station, last_station)
    @list_of_station = [first_station, last_station]
    register_instance
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

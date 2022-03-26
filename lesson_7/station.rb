class Station
  attr_reader :name, :list_of_train

  include InstanceCounter
  include Valid

  @@stations = []

  FORMAT_NAME = /^[a-z0-9]+_?[a-z0-9]+$/i

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @list_of_train = []
    @@stations << self
    validate!
    register_instance
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

  def each_train
    list_of_train.each { |train| yield(train) }
  end

private

  def validate!
    raise "Name is wrong" if name !~ FORMAT_NAME
    raise "Name must be no longer than 20 letters" if name.length > 20
  end
end

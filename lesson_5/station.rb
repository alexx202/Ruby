class Station
  attr_reader :name, :list_of_train

  include InstanceCounter

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @list_of_train = []
    @@stations << self
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
end

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

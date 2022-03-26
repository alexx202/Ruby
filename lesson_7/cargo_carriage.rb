class CargoCarriage < Carriage
  attr_reader :capacity
  attr_accessor :empty_capacity, :busy_capacity

  def initialize(capacity, number_of_carriage)
    @capacity = capacity
    @empty_capacity = capacity
    @busy_capacity = 0
    @type = "cargo"
    @number_of_carriage = number_of_carriage
    validate!
  end

  def load_cargo(cargo)
    self.busy_capacity += cargo
    self.empty_capacity -= cargo
  end

private

  def validate!
    raise "Capacity can't be negative or zero" if capacity <= 0
  end
end

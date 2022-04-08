# frozen_string_literal: true

class CargoCarriage < Carriage
  attr_reader :capacity
  attr_accessor :empty_capacity, :busy_capacity

  validate :number_of_carriage, :format, FORMAT_NUMBER
  validate :number_of_carriage, :presence
  def initialize(options = {})
    @capacity = options[:capacity]
    @empty_capacity = options[:capacity]
    @busy_capacity = 0
    @type = :cargo
    @number_of_carriage = options[:number_of_carriage]
    validate!
  end

  def load_cargo(cargo)
    self.busy_capacity += cargo
    self.empty_capacity -= cargo
  end
end

# frozen_string_literal: true

class PassengerCarriage < Carriage
  attr_reader :number_of_seats
  attr_accessor :number_of_empty_seats, :number_of_busy_seats

  validate :number_of_carriage, :format, FORMAT_NUMBER
  validate :number_of_carriage, :presence
  def initialize(options = {})
    @number_of_seats = options[:number_of_seats]
    @number_of_empty_seats = options[:number_of_seats]
    @number_of_busy_seats = 0
    @type = :passenger
    @number_of_carriage = options[:number_of_carriage]
    validate!
  end

  def take_seat
    self.number_of_empty_seats -= 1
    self.number_of_busy_seats += 1
  end
end

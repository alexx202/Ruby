class PassengerCarriage < Carriage
  attr_reader :number_of_seats
  attr_accessor :number_of_empty_seats, :number_of_busy_seats

  def initialize(number_of_seats, number_of_carriage)
    @number_of_seats = number_of_seats
    @number_of_empty_seats = number_of_seats
    @number_of_busy_seats = 0
    @type = "passenger"
    @number_of_carriage = number_of_carriage
    validate!
  end

  def take_seat
    self.number_of_empty_seats -= 1
    self.number_of_busy_seats += 1
  end

private

  def validate!
    raise "Number seats can't be negative or zero" if number_of_seats <= 0
  end
end

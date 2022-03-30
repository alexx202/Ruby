# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(name)
    super
    @type = :passenger
  end
end

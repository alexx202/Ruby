# frozen_string_literal: true

class PassengerTrain < Train
  validate :name, :format, FORMAT_NAME
  validate :name, :presence
  validate :number, :type, String
  def initialize(name)
    super
    @type = :passenger
  end
end

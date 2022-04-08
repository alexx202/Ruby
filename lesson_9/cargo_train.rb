# frozen_string_literal: true

class CargoTrain < Train
  validate :name, :format, FORMAT_NAME
  validate :name, :presence
  validate :number, :type, String
  def initialize(name)
    super
    @type = :cargo
  end
end

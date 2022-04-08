# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validation

  FORMAT_NAME = /^[a-z0-9]+_?[a-z0-9]+$/i.freeze
  @@stations = []

  validate :name, :format, FORMAT_NAME
  validate :name, :presence

  attr_reader :name, :list_of_train

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

  def each_train(&block)
    list_of_train.each(&block)
  end
end

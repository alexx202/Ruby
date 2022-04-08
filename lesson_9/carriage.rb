# frozen_string_literal: true

class Carriage
  include Company
  include Validation
  FORMAT_NUMBER = /^\d{3}$/.freeze
  attr_reader :type
  attr_accessor :number_of_carriage
end

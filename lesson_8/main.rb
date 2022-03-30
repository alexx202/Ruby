# frozen_string_literal: true

require_relative 'valid'
require_relative 'company'
require_relative 'instance_counter'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'pass_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'pass_carriage'
require_relative 'cargo_carriage'
require_relative 'interface'

Interface.new.show_interface

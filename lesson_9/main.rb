# frozen_string_literal: true

require_relative 'modules/validation'
require_relative 'modules/company'
require_relative 'modules/accessors'
require_relative 'modules/instance_counter'
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

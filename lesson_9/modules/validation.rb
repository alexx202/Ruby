# frozen_string_literal: true

module Validation
  def self.included(base)
    base.include InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(*args)
      @validations ||= []
      @validations << args
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |value|
        send(value[1].to_sym, instance_variable_get("@#{value[0]}".to_sym), value[2])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def presence(name, _parameter)
      raise 'Attribute is empty!!' if name.nil? || name.empty?
    end

    def type(name, type)
      raise 'Types are different' unless name.instance_of?(type)
    end

    def format(name, parameter)
      raise 'Format is wrong' if name !~ parameter
    end
  end
end

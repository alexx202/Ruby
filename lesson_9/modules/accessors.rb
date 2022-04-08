# frozen_string_literal: true

module Accessors
  def strong_attr_accessor(attribute, name_class)
    var_name = "@#{attribute}".to_sym
    define_method(attribute) { instance_variable_get(var_name) }
    define_method("#{attribute}=") do |value|
      raise 'Classes are different!' unless value.is_a?(name_class)

      instance_variable_set(var_name, value)
    end
  end

  def attr_accessor_with_history(*methods)
    methods.each do |method|
      var_name = "@#{method}".to_sym
      define_method(method) { instance_variable_get(var_name) }
      define_method("#{method}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        @list_of_attribute ||= {}
        @list_of_attribute[var_name] ||= []
        @list_of_attribute[var_name] << value
      end
      define_method("#{method}_history".to_sym) { @list_of_attribute[var_name] }
    end
  end
end

module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :count

    def create_count
      @count ||= 0
    end

    def instances
      @count
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.count += 1
    end
  end
end

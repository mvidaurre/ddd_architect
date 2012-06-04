class SampleFactoryMethod
  class << self
    def new_object_with_common_attributes(common_attributes)
      new(common_attributes)
    end

    def new_object_with_optional_attributes(common_attributes, optional_attributes)
      new(common_attributes,optional_attributes)
    end

    private :new
  end

  def initialize(common_attributes, optional_attributes=nil)
    
  end
    
end


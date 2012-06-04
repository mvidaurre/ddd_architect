class SampleValueObject < Struct.new(:attribute)
  def initialize(args)
    
  end
  
  def to_s
    I18n.t(key, :scope => :attributes)
  end

end
module EngineersHelper
  def get_attribute(obj, attr)
    return '' if obj.blank? || attr.blank?
    
    obj.attributes[attr.to_s]
  end
end

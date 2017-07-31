class PropertyQuery

  def self.all_uniq_properties
    properties = Property.where(property_type: ['color', 'material'])
    uniq_property_types = properties.pluck(:property_type).uniq

    uniq_property_types.map do |property|
      array_values = properties.where(property_type: property).where.not(property_value: nil).pluck(:property_value)

      { property => array_values.uniq }
    end
  end

end

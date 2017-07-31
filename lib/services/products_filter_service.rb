class ProductsFilterService

  def initialize(params)
    @range_properties      = ['price', 'weight', 'height']
    @non_permanent_options = ['amount', 'discount']

    set_params(params)
  end

  def filter
    @scope = Product.includes(:properties)

    @parsed_params.each do |param_hash|
      @scope = @scope.where(id: filtered_product_ids(param_hash.keys, param_hash.values.flatten))
    end

    @scope
  end

  private

  def set_params(params)
    params = JSON.parse(params['filter'])

    @parsed_params = params.map do |key, value|
      @range_properties.include?(key) ? { key => value } : { key => value.keys }
    end

  end

  def filtered_product_ids(property_types, property_values)
    filtered_scope = @scope.where(properties: { property_type: property_types })

    if @non_permanent_options.include?(property_types.join)
      filtered_scope.where.not(properties: { property_value: nil }).ids.uniq
    elsif @range_properties.include?(property_types.join)
      range_hash = property_values.first
      filtered_scope.where("CAST(properties.property_value AS INT) >= :min AND CAST(properties.property_value AS INT) <= :max", min: range_hash['min'], max: range_hash['max']).ids.uniq
    else
      filtered_scope.where(properties: { property_value: property_values }).ids.uniq
    end
  end

end

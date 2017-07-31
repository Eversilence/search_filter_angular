100.times do |t|

  product = Product.create(name: Faker::Commerce.product_name)
  product.properties.create(
    [
      { property_type: 'color',    property_value: Faker::Color.color_name },
      { property_type: 'price',    property_value: Faker::Number.between(1, 500) },
      { property_type: 'width',    property_value: Faker::Number.between(1, 100) },
      { property_type: 'weight',   property_value: Faker::Number.between(1, 50) },
      { property_type: 'height',   property_value: Faker::Number.between(1, 150) },
      { property_type: 'amount',   property_value: [nil, Faker::Number.between(1, 10)].sample },
      { property_type: 'fragile',  property_value: ['true', 'false'].sample },
      { property_type: 'material', property_value: Faker::Commerce.material },
      { property_type: 'discount', property_value: [nil, Faker::Number.between(1, 10)].sample },
      { property_type: 'fast_delivery', property_value: ['true', 'false'].sample },
    ]
  )
end

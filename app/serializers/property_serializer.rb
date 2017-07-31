class PropertySerializer < ActiveModel::Serializer
  attributes :id, :property_type, :property_value
end

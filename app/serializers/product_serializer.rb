class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :properties, each_serializer: PropertySerializer
end

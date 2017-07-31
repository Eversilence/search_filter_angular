class API::ProductsController < API::BaseController

  def index
    products = Product.includes(:properties)
    render json: products, each_serializer: ProductSerializer
  end

  def search
    products = ProductsFilterService.new(params).filter
    render json: products, each_serializer: ProductSerializer
  end
end

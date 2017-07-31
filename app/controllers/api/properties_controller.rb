class API::PropertiesController < API::BaseController

  def index
    properties = PropertyQuery.all_uniq_properties.compact

    render json: properties
  end

end

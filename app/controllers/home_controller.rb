class HomeController < ApplicationController
  def index

  end

  def get_image
    result = HTTParty.get(params[:image_location])

    send_data result.parsed_response,
      type: result.content_type,
      disposition: 'inline',
      status: '200',
      filename: 'seedling.jpg'
  end
end

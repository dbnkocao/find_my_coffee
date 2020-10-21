require "rest-client"
require "json"

class GetGoogleCoffeListService(latitude, longitude)
  def initialize
    @latitude = latitude
    @longitude = longitude
  end

  def call
    begin
      key = Rails.application.credentials.google_secret_key
      location = "#{@latitude},#{@longitude}"
      radius = "5000"
      base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=cooffe+shops&location=#{location}&radius=#{radius}&key=#{key}"

      response = Restclient.get base_url
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse =>
      e.response


    end
  end
end

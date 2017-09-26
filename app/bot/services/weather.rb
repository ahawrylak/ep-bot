class Weather

  def call
    @response = HTTP.get(weather_api_url).parse
    location_found? ?  formatted_response : "I don't know where it is ;(" 
  end

  private

  attr_reader :query, :response

  def initialize query
    @query = query
  end

  def weather_api_url
    ENV['WEATHER_API_URL'] + '&q=' + URI.encode(query)
  end

  def formatted_response
    response['weather'].first['main'] + ' - ' + response['weather'].first['description']
  end

  def location_found?
    response['cod'] == 200
  end

end
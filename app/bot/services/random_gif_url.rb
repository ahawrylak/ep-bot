class RandomGifUrl
  def call
    HTTP.get(giphy_url).parse.dig('data', 'image_url')
  end

  private
  attr_reader :subject

  GIPHY_API_BASE_URL = 'http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC'

  def initialize subject = 'animals'
    @subject = subject
  end

  def giphy_url
    GIPHY_API_BASE_URL + "&tag=#{subject}"
  end
end
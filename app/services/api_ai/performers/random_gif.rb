module ApiAi
  module Performers
    class RandomGif
      def initialize response, message = nil
        @response = response
        @message = message
      end

      def call
        {
          attachment: {
            type: 'image',
            payload: {
              url: RandomGifUrl.new('doge').call
            }
          }
        }
      end
      
    end
  end
end
module ApiAi
  module Performers
    class RandomGif
      attr_reader :response, :message

      def initialize response, message = nil
        @response = response
        @message = message
      end

      def call
        message.reply(text: 'Wait a second xD')
        subject = response[:parameters].fetch('subject', nil) || 'random'
        {
          attachment: {
            type: 'image',
            payload: {
              url: RandomGifUrl.new(subject).call
            }
          }
        }
      end
      
    end
  end
end
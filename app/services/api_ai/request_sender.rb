module ApiAi
  class RequestSender

    def call
       response = HTTP.auth("Bearer #{ENV['API_AI_ACCESS_TOKEN']}").get(ENV['API_AI_BASE_URL'], params: api_ai_params)
       JSON.parse(response, symbolize_name: true)
    end

    private
    attr_reader :session_id, :message

    def initialize session_id:, message:
      @session_id = session_id
      @message = message
    end

    def api_ai_params
      {
        query: message,
        lang: 'en',
        sessionId: session_id,
        v: '20170926'
      }
    end
    
  end
end
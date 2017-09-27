module ApiAi
  class ResponseParser
    attr_reader :response

    def call
      {
        output: response.dig('result', 'fulfillment', 'speech'),
        psid: response.dig('sessionId'),
        parameters: response.dig('result', 'parameters'),
        action: response.dig('result', 'action').to_sym,
        action_incomplete: response.dig('result', 'actionIncomplete')
      }
    end

    def initialize response
      @response = response
    end

  end
end
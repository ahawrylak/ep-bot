module ApiAi
  module Performers
    class DeleteTodo
      attr_reader :response, :message

      def initialize response, message = nil
        @response = response
        @message = message
      end

      def call
        { text: 'I cant delete your todo yet :(' }
      end

    end
  end
end
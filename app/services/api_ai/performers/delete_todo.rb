module ApiAi
  module Performers
    class DeleteTodo
      attr_reader :response

      def initialize response
        @response = response
      end

      def call
        { text: 'I cant delete your todo yet :(' }
      end

    end
  end
end
module ApiAi
  module Performers
    class ShowTodoList
      attr_reader :response, :message

      def initialize response, message = nil
        @response = response
        @message = message
      end

      def call
        user = User.find_by!(psid: response[:psid])
        {
          text: user.todos.map { |todo| "- #{todo.item}\n" }.join
        }
      end
    end
  end
end
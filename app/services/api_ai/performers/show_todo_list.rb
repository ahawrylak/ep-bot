module ApiAi
  module Performers
    class ShowTodoList
      attr_reader :response

      def initialize response
        @response = response
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
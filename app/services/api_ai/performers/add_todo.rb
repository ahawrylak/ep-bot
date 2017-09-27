module ApiAi
  module Performers
    class AddTodo
      attr_reader :response, :message

      def initialize response, message = nil
        @response = response
        @message = message
      end

      def call
        unless response[:action_incomplete]
          user = User.find_by!(psid: response[:psid])
          user.todos.create!(item: response[:parameters].fetch('task', ''))
        end
        message.reply(ApiAi::Performers::ShowTodoList.new(response, message).call)
        { text: response[:output] }
      end

    end
  end
end
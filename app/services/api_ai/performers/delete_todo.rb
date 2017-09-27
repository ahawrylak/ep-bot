module ApiAi
  module Performers
    class DeleteTodo
      attr_reader :response, :message

      def initialize response, message = nil
        @response = response
        @message = message
      end

      def call
        unless response[:action_incomplete]
          user = User.find_by!(psid: response[:psid])
          todo = user.todos.find_by(item: response[:parameters].fetch('task', ''))
          return { text: 'No such task on the list ;(' } unless todo
          todo.destroy!
        end
        message.reply(ApiAi::Performers::ShowTodoList.new(response, message).call)
        { text: response[:output] }
      end

    end
  end
end
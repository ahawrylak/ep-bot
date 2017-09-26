module ApiAi
  module Performers
    class AddTodo
      attr_reader :response

      def initialize response
        @response = response
      end

      def call
        unless response[:action_incomplete]
          user = User.find_by!(psid: response[:psid])
          user.todos.create!(item: response[:parameters]['task'])
        end
        { text: response[:output] }
      end

    end
  end
end
module ApiAi
  class OutputGenerator
    attr_reader :response, :message

    ACTION_PERFORMERS = {
      gif: ApiAi::Performers::RandomGif,
      create_todo: ApiAi::Performers::AddTodo,
      show_todo_list: ApiAi::Performers::ShowTodoList,
      delete_todo: ApiAi::Performers::DeleteTodo
    }.freeze

    def initialize response, message
      @response = response
      @message = message
    end

    def call
      return { text: response[:output] } unless performer = ACTION_PERFORMERS[response[:action]]
      performer.new(response, message).call
    end

  end
end
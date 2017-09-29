require 'sidekiq-scheduler'

class OutdatedTodosWorker
  include Sidekiq::Worker

  def perform
    destroyed_todos = Todo.older_than(Todo::MAX_LIFETIME).destroy_all
    destroyed_todos.each do |todo|
      todo.user.messages.create(content: "I deleted #{todo.item} when you were offline xD")
    end
  end

end

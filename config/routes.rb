
Rails.application.routes.draw do
  mount Facebook::Messenger::Server, at: 'bot'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end

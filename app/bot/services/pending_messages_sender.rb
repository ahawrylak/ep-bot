class PendingMessagesSender
  attr_reader :user, :input

  def initialize user, input
    @user = user
    @input = input
  end

  def call
    messages = user.messages.pending
    return if messages.empty?

    messages.each do |message|
      input.reply(text: message.content)
      message.update(delivered: true)
    end
  end

end
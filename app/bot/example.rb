include Facebook::Messenger

Bot.on :message do |input|
  input.typing_on

  user = User.find_or_create_by(psid: input.sender['id'])
  PendingMessagesSender.new(user, input).call

  api_ai_response = ApiAi::RequestSender.new(session_id: input.sender['id'], message: input.text).call
  parsed_response = ApiAi::ResponseParser.new(api_ai_response).call
  output = ApiAi::OutputGenerator.new(parsed_response, input).call

  input.reply(output)
end

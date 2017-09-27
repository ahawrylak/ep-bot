include Facebook::Messenger

Bot.on :message do |input|
  input.typing_on

  User.first_or_create!(psid: input.sender['id'])

  api_ai_response = ApiAi::RequestSender.new(session_id: input.sender['id'], message: input.text).call
  parsed_response = ApiAi::ResponseParser.new(api_ai_response).call
  output = ApiAi::OutputGenerator.new(parsed_response, input).call

  input.reply(output)
end

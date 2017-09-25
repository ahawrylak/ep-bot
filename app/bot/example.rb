include Facebook::Messenger

GIF_REGEX = /(gif)\s(?<subject>.+)/

Bot.on :message do |message|
  message.mark_seen
  message.typing_on

  if matches = GIF_REGEX.match(message.text)
    gif_url = RandomGifUrl.new(matches[:subject]).call
    message.reply(
      attachment: {
        type: 'image',
        payload: {
          url: gif_url
        }
      }
    )
  else
    message.reply(text: 'Ich nie understand :((')
  end
end
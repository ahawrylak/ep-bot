include Facebook::Messenger

Bot.on :message do |message|
  message.mark_seen
  message.typing_on

  if message.text.include? 'weather'
    location = message.text.gsub('weather', '').strip
    weather_info = Weather.new(location).call
    message.reply(text: weather_info)
  else
    message.reply(text: 'Nye panimayu xD')
  end
end
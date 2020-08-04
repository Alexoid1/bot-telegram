require 'telegram/bot'
require_relative '../lib/quotes.rb'
require_relative '../lib/jokes.rb'
require 'date'
token = '1399675839:AAGW44eSHQZ_6J5b7r2GP83IOcan8d7swVk'

puts 'go to the next link to use the bot'
puts 'https://web.telegram.org/#/im?p=@Alexoid_bot'

def interval_joke(time, message)
  itsTime = (Time.now + time * 60).strftime('%R')
  sleep(1) until Time.now.strftime('%R') == itsTime
  token2 = '1399675839:AAGW44eSHQZ_6J5b7r2GP83IOcan8d7swVk'
  Telegram::Bot::Client.run(token2) do |bot|
    jok = Jokes.new
    @joke = JSON.parse(jok.posts).sample
    bot.api.send_message(chat_id: message.chat.id, text: "Listen this joke #{message.from.first_name}, '#{@joke['content']}")
    bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name} will recive the next joke in #{time} minutes")
    $bot
  end
end

def interval_quote(time, message)
  itsTime = (Time.now + time * 60).strftime('%R')
  p itsTime
  sleep(1) until Time.now.strftime('%R') == itsTime
  p 'CONGRATS'
  token2 = '1399675839:AAGW44eSHQZ_6J5b7r2GP83IOcan8d7swVk'
  Telegram::Bot::Client.run(token2) do |bot|
    quotes = Quotes.new
    @quo = JSON.parse(quotes.posts).sample
    bot.api.send_message(chat_id: message.chat.id, text: "My advise to you #{message.from.first_name} is: '#{@quo['text']}'\n#{@quo['author']}")
    $bot
  end
end

$bot = Telegram::Bot::Client.run(token) do |bot|
  quotes = Quotes.new
  jok = Jokes.new
  greeting = ['Hello I am Albot', 'Hello Human', '68 65 6c 6c 6f !!!!Ohhh sorry I just say hello in my native lenguage', 'HI !!!', 'hello there', 'Whats up Dude', 'Hello meat sack... hahaha ']
  bot.listen do |message|
    bot.api.send_message(chat_id: message.chat.id, text: greeting.sample)
    if message.text.match(/hello/)
      bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name} nice to meet you")
    elsif message.text.match(/joke_every [0-9]{1,2}/)
      inter = message.text.scan(/[0-9]{1,2}/)[0]
      @seconds = inter.to_i
      interval_joke(@seconds, message)
    elsif message.text.match(/quote_every [0-9]{1,2}/)
      inter = message.text.scan(/[0-9]{1,2}/)[0]
      @seconds = inter.to_i
      interval_quote(@seconds, message)
    end
    case message.text
    when '/quote'
      @quo = JSON.parse(quotes.posts).sample
      bot.api.send_message(chat_id: message.chat.id, text: "My advise to you #{message.from.first_name} is: '#{@quo['text']}'\n#{@quo['author']}")
    when '/joke'
      @joke = JSON.parse(jok.posts).sample

      bot.api.send_message(chat_id: message.chat.id, text: "Listen this joke #{message.from.first_name}, '#{@joke['content']}")
    when '/time'

      bot.api.send_message(chat_id: message.chat.id, text: "Time now #{Time.now.hour}:#{Time.now.min}")
    when '/date'

      bot.api.send_message(chat_id: message.chat.id, text: "Date today #{Time.now.day}/#{Time.now.month}/#{Time.now.year}")

    when '/end'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye #{message.from.first_name} have a nice day")
    end
  end
end

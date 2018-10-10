# ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'dotenv'
Dotenv.load
require 'twitter'
require 'pry'

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
 config.consumer_key        = ENV['TWITTER_API_KEY']
 config.consumer_secret     = ENV['TWITTER_API_SECRET']
 config.access_token        = ENV["TWITTER_API_TOKEN"]
 config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end
client.follow("Frederic_Molas")
p client.followers("CalaMchn")

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_API_KEY']
  config.consumer_secret     = ENV['TWITTER_API_SECRET']
  config.access_token        = ENV["TWITTER_API_TOKEN"]
  config.access_token_secret = ENV["TWITTER_API_TOKEN_SECRET"]
end

topics = ["Ruby", "rails"]
client.filter(track: topics.join(",")) do |object|
  puts object.text+"\n" if object.is_a?(Twitter::Tweet)
end
# ligne qui permet de tweeter
#p client
#client.update('Mon second tweet en ruby !!!!')

#binding.pry

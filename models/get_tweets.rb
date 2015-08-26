# This class handles connecting to the Twitter API. In Rack Todo, this lived in app.rb. Here's we've abstracted it out into its own class. This class we will then initialize in app.rb.

# Our Gemfile has the twitter gem and config/environment requires it through Bundler.
require 'pry'
class GetTweets
  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  TWITTER = Twitter::REST::Client.new do |config|
    # go to https://dev.twitter.com/apps and create your own twitter app. Then grab your keys and replace these ones
    config.consumer_key = "ShWgCGPVuxVaoApucaKM0ZK9E"
    config.consumer_secret = "pQfryUlpOvmdcrMy1sbPLJ11Z6vCDBjT59YRN4W4eRkrBlGeR1"
    config.access_token = "3161029745-AiDjvyGvT1It13VyRt8O16iSdyLIDyp6qymgQnd"
    config.access_token_secret = "pakcsyeHlW7tC3IQQW9SseJ4DhhdavhsDAaDEYUYtkPK9"
  end

  def get_search_results
    twitter_search_results = []
    TWITTER.search(handle).each do |tweet|
      # binding.pry
      # we're saving the tweet user's name and the tweet text in an array of arrays
      twitter_search_results << [tweet.user.name, tweet.text]
    end
    twitter_search_results
  end

end

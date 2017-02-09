require './tweet'
require './referenceable'

class User
  extend Referenceable::ClassMethods
  include Referenceable::InstanceMethods
  
  attr_accessor :name
  attr_reader :tweets
  @count = 0
  @all = []
  @last_id = 0

  def initialize(name)
    User.count += 1
    User.all << self
    User.last_id += 1
    @name = name
    @tweets = []
    @id = User.last_id
  end
  
  def create_tweet(body)
    if Tweet.valid?(body)
      Tweet.new(self, body)
    else
      nil
    end
  end

  def find_tweet(id)
    f_tweet = nil
    @tweets.each { |tweet| f_tweet = tweet if id == tweet.id }
    f_tweet
  end

  def delete_tweet(id)
    d_tweet = find_tweet(id)
    unless d_tweet.nil?
      Tweet.delete(id)
      @tweets.delete(d_tweet)
    end
    d_tweet
end

  def delete_tweets
    @tweets.each { |tweet| Tweet.delete(tweet.id) }
    @tweets = []
  end
    
  def self.valid?(name)
    !name.empty? && name.capitalize == name
  end

end

u = User.new('Evan')
p '--- Create Tweet'
u.create_tweet('Evans Body')
u.create_tweet('Evans Body2')
p u.tweets
p Tweet.all
p Tweet.count
p '--- Delete Tweet'
u.delete_tweets
p u.tweets
p Tweet.all
p Tweet.count

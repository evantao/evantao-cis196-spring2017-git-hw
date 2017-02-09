require './user'
require './referenceable'

class Tweet
  extend Referenceable::ClassMethods
  include Referenceable::InstanceMethods

  attr_reader :user
  attr_accessor :body
  @last_id = 0
  @all = []
  @count = 0

  def initialize(user, body)
    Tweet.last_id += 1
    Tweet.all << self
    Tweet.count += 1
    @user = user
    user.tweets << self
    @body = body
    @id = Tweet.last_id
  end

  def self.valid?(body)
    !body.empty? && body.length <= 140
  end
  
end


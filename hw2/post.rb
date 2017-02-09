require './user'
require './referenceable'

class Post
  extend Referenceable::ClassMethods
  include Referenceable::InstanceMethods

  attr_accessor :title
  attr_accessor :body
  attr_reader :user
  @count = 0
  @all = []
  @last_id = 0

  def initialize(user, title, body)
    Post.count += 1
    Post.all << self
    Post.last_id += 1
    @user = user
    user.posts << self
    @title = title
    @body = body
    @id = Post.last_id
  end
end

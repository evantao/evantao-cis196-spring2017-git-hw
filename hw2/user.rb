require './post'
require './referenceable'

class User
  extend Referenceable::ClassMethods
  include Referenceable::InstanceMethods

  attr_accessor :name
  attr_reader :posts
  @last_id = 0
  @all = []
  @count = 0

  def initialize(name)
    User.all << self
    User.count += 1
    User.last_id += 1
    @name = name
    @posts = []
    @id = User.last_id
  end

  def create_post(title, body)
    Post.new(self, title, body)
  end

  def find_post(id)
    f_post = nil
    @posts.each { |post| f_post = post if id == post.id }
    f_post
  end

  def delete_post(id)
    del_post = find_post(id)
    unless del_post.nil?
      Post.delete(id)
      @posts.delete(del_post)
    end
    del_post
  end
end

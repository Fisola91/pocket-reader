class Post
  def initialize
    @post_read_completed = false
  end

  def mark_post_as_read
    @post_read_completed = true
  end
end

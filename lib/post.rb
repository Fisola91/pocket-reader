class Post
  attr_reader :title, :author
  def initialize(attribute = {})
    @author = attribute[:author]
    @title = attribute[:title]
    @content = attribute[:content]
    @post_read_completed = false
  end

  def mark_post_as_read
    @post_read_completed = true
  end

  def post_read?
    @post_read_completed
  end
end

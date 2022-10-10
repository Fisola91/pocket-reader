class Post
  attr_reader :title, :author, :path, :content
  def initialize(attribute = {})
    @path = attribute[:path]
    @author = attribute[:author]
    @title = attribute[:title]
    @content = attribute[:content]
    @post_read = attribute[:post_read] == "true"
  end

  def post_read?
    @post_read
  end

  def to_s
    "#{title} (#{author})\n\n#{content}"
  end

  def mark_as_read!
    @post_read = true
  end

end

require "open-uri"
require "nokogiri"

require_relative "view"
class Controller
  BASE_URL = "https://dev.to/"
  USER_AGENT = "Mozilla/5.0 (Windows NT x.y; rv:10.0) Gecko/20100101 Firefox/10.0"

  def initialize(repository)
    @view = View.new
    @repository = repository
  end

  def index
    list_posts
  end

  def create
    path = @view.save_post_for(:path)
    file = URI.open("#{BASE_URL}#{path}", "User-Agent" => USER_AGENT).read
    doc = Nokogiri::HTML(file)
    title = doc.search("h1").first.text.strip
    paragraphs = doc.search("#article-body p")
    content = paragraphs.map(&:text).join("\n\n")
    author = doc.search(".crayons-article__header__meta a.crayons-link.fw-bold").text.strip
    post = Post.new(path: path, author: author, title: title, content: content)
    @repository.add_post(post)
    list_posts
  end

  def mark_as_read
    list
    index = @view.ask_user_for_index
    @repo.mark_as_read(index)
    list
  end
  # [post.path, post.author, post.title, post.content, post.post_read?]
  # def save_post
  #   # 1. Get user input
  #   attribute = @view.save_post_for_later

  #   # 2. Create instance of the post
  #   post = Post.new(attribute)

  #   #3. add to the repo
  #   @repository.add_post(post)
  # end
end
private
def list_posts
  posts = @repository.all
  @view.list_all_posts(posts)
end

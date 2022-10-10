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
  def show
    list_posts
    index = @view.ask_for_index
    post = @repository.find(index)
    @view.display_content(post)
  end

  def mark_as_read
    list_posts
    index = @view.ask_for_index
    @repository.mark_as_read(index)
    list_posts
  end

  def destroy
    list_posts
    index = @view.ask_for_index
    post = @repository.find(index)
    @repository.delete(post)
    list_posts
  end

  private
  def list_posts
    posts = @repository.all
    @view.list_all_posts(posts)
  end
end

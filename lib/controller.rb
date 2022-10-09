class Controller
  def initialize(view, repository)
    @view = view
    @repository = repository
  end

  def list_posts
    # 1. Get all posts from repo
    posts = @repository.all

    #2. Ask view to print task
    @view.list_all_posts(posts)
  end
end

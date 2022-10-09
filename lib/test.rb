require_relative "post"
require_relative "repository"
require_relative "controller"
require_relative "view"

repo = Repository.new(File.join(__dir__, 'posts.csv'))
view = View.new
controller = Controller.new(view, repo)

controller.list_posts

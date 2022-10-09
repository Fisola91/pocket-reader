require_relative "post"
require_relative "repository"

repo = Repository.new(File.join(__dir__, 'posts.csv'))
p repo

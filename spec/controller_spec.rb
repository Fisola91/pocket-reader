require "controller"
require_relative "repository"



RSpec.describe Controller do
  # view = View.new
  repository = Repository.new(File.join(__dir__, 'posts.csv'))
  let(:controller) { Controller.new(repository) }

  it "allows user to list posts" do
    posts = repository.all
    expect(controller.list_posts).to eq(post)
  end

end

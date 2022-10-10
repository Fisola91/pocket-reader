require "csv"
require_relative "post"

class Repository
  def initialize(csv_file)
    @csv_file = csv_file
    @posts = []
    load_csv if File.exist?(@csv_file)
  end

  def all
    @posts
  end

  def add_post(post)
    @posts << post
    save
  end

  def find(index)
    @posts[index]
  end

  def mark_as_read(index)
    @posts[index].mark_as_read!
    save
  end

  def delete(index)
    @posts.delete(index)
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @posts << Post.new(
        path: row[0],
        author: row[1],
        title: row[2],
        content: row[3],
        post_read: row[4]
      )
    end
  end

  def save
    CSV.open(@csv_file, "wb") do |csv|
      @posts.each do |post|
        csv << [post.path, post.author, post.title, post.content, post.post_read?]
      end
    end
  end
end

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

  def find(index)
    @posts[index]
  end




  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @posts << Post.new(row)
    end
  end
end

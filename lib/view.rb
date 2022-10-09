class View

  def list_all_posts(posts)
    posts.each_with_index do |post, index|
      puts "#{index + 1} - #{post.title} (#{post.author})"
    end

  end

end

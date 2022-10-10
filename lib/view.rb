class View

  def list_all_posts(posts)
    posts.each_with_index do |post, index|
      p post
      status = post.post_read? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{status} - #{post.title} (#{post.author})"
    end

    def save_post_for(stuff)
      puts "#{stuff.capitalize}?"
      print "> "
      gets.chomp
    end
  end

end

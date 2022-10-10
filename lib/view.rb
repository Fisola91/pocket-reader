class View

  def list_all_posts(posts)
    posts.each_with_index do |post, index|
      status = post.post_read? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{status} - #{post.title} (#{post.author})"
    end

    def save_post_for(stuff)
      puts "#{stuff.capitalize}?"
      print "> "
      gets.chomp
    end

    def ask_for_index
      puts "Index?"
      print "> "
      gets.chomp.to_i - 1
    end

    def display_content(post)
      puts post
    end
  end

end

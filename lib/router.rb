class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    puts "----------------------------"
    puts "welcome to your DEV Pocket Reader"
    puts "----------------------------\n\n"

    loop do
      puts "----------------------------"
      puts "What do you want to do next?"
      puts "----------------------------"

      puts "1. List posts"
      puts "2. Save post for later"
      puts "3. Read post"
      puts "4. Mark post as read"
      puts "5. Delete post"
      puts "6. Exit"

      choice = gets.chomp.to_i
      case choice
      when 1 then @controller.index
      when 2 then @controller.create
      when 3 then @controller.show
      when 4 then @controller.mark_as_read
      when 5 then @controller.destroy
      else
        puts "Try again"
      end
    end
  end
end

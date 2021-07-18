module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = ['First post', 'Second post', 'Third post', 'Fourth post']
  end

  def index
    @posts.each do |post|
      puts post
    end
  end

  def show
    puts 'Please input post id:'
    post_id = gets.chomp.to_i
    if @posts[post_id] != nil
      puts @posts[post_id]
    else
      puts 'Post not found'
    end
  end

  def create
    puts 'Enter body of your post:'
    post = gets.chomp
    @posts.push(post)
  end

  def update
    @posts.each_with_index do |post, index|
      puts "#{index} : #{post}"
    end
    puts 'Please input post id for update:'
    post_id = gets.chomp.to_i
    puts 'Please input updated post:'
    post_body = gets.chomp.to_str
    @posts[post_id] = post_body
  end

  def destroy
    puts 'Please input post id for DELETE:'
    post_id = gets.chomp.to_i
    if @posts[post_id] != nil
      @posts.delete_at(post_id)
    else
      puts 'Post not found'
    end
  end

end

class CommentsController
  extend Resource

  def initialize
    @comments = ['First comment', 'Second comment', 'Third comment', 'Fourth comment']
  end

  def index
    @comments.each do |comment|
      puts comment
    end
  end

  def show
    puts 'Please input comment id:'
    comment_id = gets.chomp.to_i
    if @comments[comment_id] != nil
      puts @comments[comment_id]
    else
      puts 'Post not found'
    end
  end

  def create
    puts 'Enter body of your comment:'
    comment = gets.chomp
    @comments.push(comment)
  end

  def update
    @comments.each_with_index do |comment, index|
      puts "#{index} : #{comment}"
    end
    puts 'Please input comment id for update:'
    comment_id = gets.chomp.to_i
    puts 'Please input updated comment:'
    comment_body = gets.chomp.to_str
    @comments[comment_id] = comment_body
  end

  def destroy
    puts 'Please input comment id for DELETE:'
    comment_id = gets.chomp.to_i
    if @comments[comment_id] != nil
      @comments.delete_at(comment_id)
    else
      puts 'Comment not found'
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp
      case choise
      when '1' then PostsController.connection(@routes['posts'])
      when '2' then CommentsController.connection(@routes['comments'])
      end
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init


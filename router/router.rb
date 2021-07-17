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
    @posts = []
  end

  def index
    puts 'index posts'
  end

  def show
    puts 'show post'
  end

  def create
    puts 'create post'
  end

  def update
    puts 'update post'
  end

  def destroy
    puts 'destroy post'
  end
end

class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    #puts 'index'
    #@comments.each { |comment| puts comment }
    puts 'index comments'
  end

  def show
    puts 'show comment'
  end

  def create
    puts 'create comment'
  end

  def update
    puts 'update comment'
  end

  def destroy
    puts 'destroy comment'
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
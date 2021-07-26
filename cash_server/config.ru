require 'rack'
require 'rack/response'
require './cashmachine.rb'

class CashServer
  def initialize
    @cm = CashMachine.new
  end

  def call(env)
    req = Rack::Request.new(env)
    value = 0
    if req.fullpath.include?('value=')
      path, value = req.fullpath.split('?value=')
      case path
      when /withdraw/
        [200, {"Content-Type" => "text/html"}, ["<h2>Balance after withdraw: #{@cm.withdraw(value.to_f)}
                                                 </h2><br> #{@cm.log.reverse}"] ]
      when /deposit/
        [200, {"Content-Type" => "text/html"}, ["<h2>Balance after deposit: #{@cm.deposit(value.to_f)}
                                                 </h2><br>  #{@cm.log.reverse}"]]

      end
    elsif req.path_info == '/balance'
      [200, {"Content-Type" => "text/html"}, ["<h2>Current balance #{@cm.balance}
                                               </h2><br> #{@cm.log.reverse}"] ]
    else
      [404, {"Content-Type" => "text/html"}, ["<h2>Not found, #{req.path_info}
                                               </h2><br> #{self.class.object_id}"]]
    end
    end
    resp = Rack::Response.new

end

run CashServer.new

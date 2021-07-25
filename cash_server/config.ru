require 'rack'
require 'rack/response'
require './cashmachine.rb'

use Rack::Reloader, 0

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
        [200, {"Content-Type" => "text/html"}, ["#{@cm.withdraw(value.to_f)}, #{@cm.class.object_id}, #{self.class.object_id} "] ]
      when /deposit/
        [200, {"Content-Type" => "text/html"}, ["deposit now: #{@cm.deposit(value.to_f)}, #{@cm.class.object_id}, #{self.class.object_id}"]]
      end
    elsif req.path_info == '/balance'
      [200, {"Content-Type" => "text/html"}, ["#{@cm.balance}, #{@cm.class.object_id}, #{self.class.object_id}"] ]
    else
      [404, {"Content-Type" => "text/html"}, ["Not found, #{req.path_info}, #{self.class.object_id}"]]
    end
    end
    resp = Rack::Response.new

end

run CashServer.new

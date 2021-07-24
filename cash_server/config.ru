require 'rack'
require 'rack/response'
require './cashmachine.rb'

use Rack::Reloader, 0

class CashServer
  def call(env)
    cm = CashMachine.new
    req = Rack::Request.new(env)
    value = 0
    if req.fullpath.include?('value=')
      path, value = req.fullpath.split('?value=')
      case path
      when /withdraw/
        [200, {"Content-Type" => "text/html"}, ["#{cm.withdraw(value.to_f)}"] ]
      when /deposit/
        [200, {"Content-Type" => "text/html"}, ["deposit now: #{cm.deposit(value.to_f)}"]]
      end
    elsif req.path_info == '/balance'
      [200, {"Content-Type" => "text/html"}, ["#{cm.balance}"] ]
    else
      [404, {"Content-Type" => "text/html"}, ["Not found, #{req.path_info}"]]
    end
    end
    resp = Rack::Response.new

end

run CashServer.new

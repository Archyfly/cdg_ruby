require 'rack'
require 'rack/response'
require './cashmachine.rb'

use Rack::Reloader, 0

class CashServer
  def call(env)
    cm = CashMachine.new
    req = Rack::Request.new(env)
    resp = Rack::Response.new
    case req.path
    when /balance/
      [200, {"Content-Type" => "text/html"}, ["#{cm.balance}"] ]
    when /withdraw/
      [200, {"Content-Type" => "text/html"}, ["withdraw"] ]
    when /deposit/
      [200, {"Content-Type" => "text/html"}, ["deposit"]]
    else
      [400, {"Content-Type" => "text/html"}, ["Not found"]]
    end
  end
end

run CashServer.new

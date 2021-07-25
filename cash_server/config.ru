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
        [200, {"Content-Type" => "text/html"}, ["Balance after withdraw: #{@cm.withdraw(value.to_f)}, #{@cm.log.reverse}"] ]
      when /deposit/
        [200, {"Content-Type" => "text/html"}, ["Balance after deposit: #{@cm.deposit(value.to_f)}, #{@cm.log.reverse}"]]

      end
    elsif req.path_info == '/balance'
      [200, {"Content-Type" => "text/html"}, ["Current balance #{@cm.balance}, #{@cm.log.reverse}"] ]
    else
      [404, {"Content-Type" => "text/html"}, ["Not found, #{req.path_info}, #{self.class.object_id}"]]
    end
    end
    resp = Rack::Response.new

end

run CashServer.new

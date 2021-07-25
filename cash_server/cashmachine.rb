class CashMachine
  attr_accessor :balance, :log
  def initialize
    @balance = 100.0
    @log = []
  end

  def balance
    cm_log("check_balance", @balance)
    return @balance
  end

  def withdraw(value)
    if check_balance(value)
      cm_log("withdraw", value)
      return @balance = @balance - value
    else
      puts "Amount of withdraw exceeds current balance!"
    end
  end

  def deposit(value)
    cm_log("deposit", value)
    return @balance = @balance + value
  end

  def check_balance(amount)
    @balance >= amount
  end

  def cm_log(method, value)
    @log.push("#{method} at #{Time.now} is #{value.to_f}")
  end

end


class CashMachine
  attr_accessor :balance
  def initialize
    @balance = 100.0
  end

  def balance
    return @balance
  end

  def withdraw(value)
    if check_balance(value)
      return @balance = @balance - value
    else
      puts "Amount of withdraw exceeds current balance!"
    end
  end

  def deposit(value)
    return @balance = @balance + value
  end

  def check_balance(amount)
    @balance >= amount
  end

end

cm=CashMachine.new
puts cm.balance
cm.withdraw(10)
puts cm.balance
cm.withdraw(5)
puts cm.balance
cm.deposit(150)
puts cm.balance

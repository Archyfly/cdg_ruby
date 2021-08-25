class CashMachine
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def withdraw(amount)
    if amount > @balance
      raise "Amount of withdraw exceeds current balance!"
    else
      @balance -= amount
    end
  end

  def deposit(amount)
    if amount.nil? || amount < 0
      raise "Please input correct amount > 0"
    else
      @balance += amount
    end
  end

end


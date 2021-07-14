class CashMachine
  attr_accessor :balance

  def initialize
    @balance
  end

  def withdraw(amount)
    if check_balance(amount)
      @balance -= amount
    else
      puts "Amount of withdraw exceeds current balance!"
    end
  end

  def deposit(amount)
    @balance += amount
  end

  def check_balance(amount)
    @balance >= amount
  end
end

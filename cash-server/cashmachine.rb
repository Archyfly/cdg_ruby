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
      @balance -= value
    else
      puts "Amount of withdraw exceeds current balance!"
    end
  end

  def deposit
    puts 'Enter deposit amount:'
    amount = gets.chomp.to_f
    @balance += amount
  end

  def check_balance(amount)
    @balance >= amount
  end

end
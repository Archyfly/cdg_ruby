class CashMachine
  attr_accessor :balance
  def initialize
    @balance = 100.0
  end

  def balance
    return @balance
  end

  def self.init
    cm = CashMachine.new
    loop do
      puts 'Input action: B - Balance, D - Deposit, W - Withdraw, Q - Quit'
      choice = gets.chomp.downcase
      break if choice == 'q'
      cm.user(choice)
    end
  end

  def withdraw
    puts 'Enter withdraw amount:'
    amount = gets.chomp.to_f
    if check_balance(amount)
      @balance -= amount
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

  def user(choice)
    case choice
    when 'b' then p balance
    when 'd' then p deposit
    when 'w' then p withdraw
    end
  end

end
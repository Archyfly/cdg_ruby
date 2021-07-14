class Transaction
  require './cash-machine.rb'

  def initialize
    @cm = CashMachine.new
    @cm.balance = 100
  end

  def dep
    puts 'Enter deposit amount:'
    amount = gets.chomp.to_f
    @cm.deposit(amount)
  end

  def balance
    @cm.balance
  end

  def wtdraw
    puts 'Enter withdraw amount:'
    amount = gets.chomp.to_f
    @cm.withdraw(amount)
  end

  def list
    puts '--- CashMachine ---'
    puts 'For check your balance input: B'
    puts 'For deposit input: D'
    puts 'For withdraw input: W'
    puts 'For quit: Q'
  end

  def user(choice)
    case choice
    when 'b' then p balance
    when 'd' then p dep
    when 'w' then p wtdraw
    end
  end

  def menu
    # transaction = CashMachine.new
    loop do
      list
      choice = gets.chomp.downcase
      break if choice == 'q'
      user(choice)
    end
  end
end

t = Transaction.new
t.menu

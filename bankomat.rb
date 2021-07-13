def read_balance
  file = File.open("balance.txt", "r")
  balance = file.readline.to_i
  file.close
  return balance
end

def deposit(amount)
  read_balance + amount
end

def withdraw(amount)
  read_balance - amount
end

def check_balance(amount)
  return read_balance >= amount
end

def deposit_question
  puts "Введите сумму для пополнения:"
  deposit_amount = gets.chomp.to_i
  new_balance = deposit(deposit_amount)
  write_to_file(new_balance)
end

def write_to_file(amount)
  file = File.open("balance.txt", "w+")
  file.write(amount)
  file.close
end

def withdraw_question
  puts "Введите сумму для снятия:"
  withdraw_amount = gets.chomp.to_i
  if check_balance(withdraw_amount)
    new_balance = withdraw(withdraw_amount)
    puts new_balance
    write_to_file(new_balance)
  else
    puts "Your balance is #{read_balance}. Withdraw is impossible"
  end
end

def list
  puts "--- CashMashine ---"
  puts "For check your balance input: B"
  puts "For deposit input: D"
  puts "For withdraw input: W"
  puts "For quit: Q"
end

def user(choice)
  case choice
    when 'b' then puts read_balance
    when 'd' then deposit_question
    when 'w' then withdraw_question
  end
end


def menu
  loop do
    list
    choice = gets.chomp.downcase
    break if choice == "q"
    user(choice)
  end
end

menu

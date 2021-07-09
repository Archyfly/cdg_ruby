# Скрипт принимает два числа, если хоть одно = 20 - выводит 20, иначе возвращает сумму этих чисел.

def is_twenty
  puts "Сравнение введенного числа с 20:"
  puts "Введите первое число:"
  one = gets.chomp.to_i
  puts "Введите второе число:"
  two = gets.chomp.to_i
  if (one == 20) || (two == 20)
    return 20
  else
    return one+two
  end
end

puts is_twenty

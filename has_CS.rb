#Скрипт принимает число и слово. Если слово оканчивается на CS - выводит на экран цифру 2 в степени длины введенного слова. Если не заканчивается: выводит введенное слово наоборот

def string_has_cs
  puts "Введите проверяемое слово:"
  word = gets.chomp.to_s
  pow = word.size
  str_array = word.split('')
  if has_not_cs?(str_array)
    return word.reverse!
  else
    return 2**pow
  end
end

def has_not_cs?(str_array)
  if str_array[-2] == "C" && str_array[-1] == "S"
    return false
  else
    return true
  end
end

puts string_has_cs
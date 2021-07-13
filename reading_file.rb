# У вас есть файл, со следующей структурой и содержащий не менее 10 строк: Имя, фамилия и возраст
# Иван Иванов 20
# Петр Петров 21
# Необходимо прочитать файл, затем запросив у пользователя ввод возраста, найти в результатах чтения файла, студента
# чей возраст равен введенному числу и записать этого студента(тов) в другой файл с названием results.txt. После этого
# перезапросить ввод. Программа завершается выводом на экран содержимого файла results.txt построчно, если все
# студенты из первого файла были записаны во второй или если пользователь ввел с клавиатуры -1

AGES = (17..99).freeze

def compare_files
  File.read('students.txt').size == File.read('results.txt').size
end

def read_file(str, age)
  file = File.open(str)
  file_data = file.read.split("\n")
  arr_to_insert = []
  count = 0
  file_data.each do |line|
    if line.include?(age)
      arr_to_insert.push(line)
      count = count + 1
    end
  end
  puts "Записей добавлено: #{count}"
  arr_to_insert.each do |line|
    string_for_write = line + '\n'
    write_to_results(string_for_write)
  end
  file.close
end

def write_to_results(string_for_write)
  file = File.open('results.txt', 'a+')
  file.write(string_for_write)
  file.close
end

def list
  puts '------ Формирование списка на основе возраста --------'
  puts 'Введите возраст (или введите -1 для выхода)'
end

def view_menu
  input_age = []
  if File.exist?('results.txt')
    file = File.open('results.txt', 'w')
    file.close
  else
    File.new('results.txt')
  end
  loop do
    break if compare_files == true

    list
    choice = gets.chomp
    break if choice == '-1'

    if input_age.include?(choice) || choice == ''
      puts 'Пустой ввод или выбор по этому году уже проводился.'
      next
    elsif !AGES.include?(choice.to_i)
      puts 'Некорректный ввод. Введите значение от 17 до 99'
      next
    else
      read_file('students.txt', choice)
    end
    input_age.push(choice)
  end
  puts "Из предоставленного списка перенесены записи, соответствующие возрастам #{input_age}."
  file = File.open('results.txt')
  file_data = file.readlines
  puts file_data
end

view_menu

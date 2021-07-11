=begin
У вас есть файл, со следующей структурой и содержащий не менее 10 строк: Имя, фамилия и возраст
Иван Иванов 20
Петр Петров 21
Необходимо прочитать файл, затем запросив у пользователя ввод возраста, найти в результатах чтения файла, студента
чей возраст равен введенному числу и записать этого студента(тов) в другой файл с названием results.txt. После этого
перезапросить ввод. Программа завершается выводом на экран содержимого файла results.txt построчно, если все
студенты из первого файла были записаны во второй или если пользователь ввел с клавиатуры -1
=end

def compare_files
  return File.read("students.txt").size == File.read("results.txt").size
end

def read_file(str, age)
  file = File.open(str)
  file_data = file.read.split("\n")
  arr_to_insert = []
  file_data.each do |line|
    if line.include?(age)
      arr_to_insert.push(line)
    end
  end
  arr_to_insert.each do |line|
    wts = line + "\n"
    write_to_results(wts)
  end
  file.close
end

def check_input(input)

end

def write_to_results(wts)
  file = File.open("results.txt", "a+")
  file.write(wts)
  puts "Запись добавлена"
  puts compare_files
  file.close
end

def list
  puts '------ Формирование списка на основе возраста --------'
  puts 'Введите возраст (или введите -1 для выхода)'
end

def view_menu
  input_age = []
  loop do
    break if compare_files == true
    list
    #file_for_search = "students.txt"
    #file_for_write =  "results.txt"
    choice = gets.chomp
    break if choice == '-1'
    if input_age.include?(choice)
      puts "Выбор по этому году уже проводился."
      next
    else
      read_file('students.txt', choice)
    end
    input_age.push(choice)
  end
  puts "Из предоставленного списка перенесены все записи."
  file = File.open("results.txt")
  file_data = file.readlines
  puts file_data
end

view_menu
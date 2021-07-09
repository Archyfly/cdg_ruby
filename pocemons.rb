# Скрипт, выводящий массив покемонов. Спрашивает, сколько добавить покемонов.
# Для каждого добавляемого покемона спрашивает его имя и цвет.
# Выводит в конце массив, содержащий хэши покемонов в формате 
# [{name: “Vasya“, color: “Yellow“}, {name: “Oleg“, color: “Red“}]

def pocemon
  puts "Сколько покемонов вы хотите добавить?"
  n = gets.chomp.to_i
  i = 1;
  pocehash = {}
  @pocemon_mass = []
  while (i<=n) do
    puts "Введите имя #{i} покемона"
    name = gets.chomp.to_s
    puts "Введите цвет покемона"
    color = gets.chomp.to_s
    pocehash = {name: name, color: color}
    add_pocemon(pocehash)
    i = i + 1
  end
  print @pocemon_mass
end

def add_pocemon(pocehash)
  @pocemon_mass.push(pocehash)
end

print pocemon



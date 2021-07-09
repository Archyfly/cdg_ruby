# Скрипт, принимающий имя, фамилию и возраст.
# На основании возраста два варианта возвращемого ответа:
# <18: Привет, #{name}. Тебе меньше 18 лет, но начать учиться программировать # никогда не рано"
# ELSE "Привет, #{name}. Самое время занятся делом"

def greets(name, age)
  if age < 18
    return "Привет, #{name}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    return "Привет, #{name}. Самое время занятся делом"
  end
end

def enter_your_params
  puts "Введи своё имя и фамилию:"
  your_name = gets.chomp.to_s
  puts "Сколько тебе лет?"
  your_age = gets.chomp.to_i
  puts greets(your_name, your_age)
end

enter_your_params


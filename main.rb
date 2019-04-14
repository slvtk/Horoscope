require_relative 'Horoscope.rb'

state=true

while state==true
	begin
		puts "\nВведите знак зодиака:"
		#Создание объекта 
		horo=Horoscope.new(gets.chomp.encode('UTF-8').capitalize)
		#Проверка корректности ввода
		if !horo.zodiac_sign
			raise
		end
	rescue=>error
		puts "Некорректный знак зодиака"
		retry
	end
	#вывод гороскопа
	horo.show_horo

end
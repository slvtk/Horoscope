require_relative 'Horoscope.rb'

while true
	begin
		puts "\nВведите знак зодиака:"
		#Создание объекта 
		horo=Horoscope.new(gets.chomp.encode('UTF-8').capitalize)
		#вывод гороскопов
		if horo.zodiac_sign
			horo.show_horo
		else
			puts "Некорректный знак!"
		end
	end
end
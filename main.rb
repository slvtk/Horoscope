require_relative 'Horoscope.rb'
	state=true

	while state==true

		puts "\nВведите знак зодиака:"

    horo_sign=Horoscope.new(gets.chomp.encode('UTF-8').capitalize)

    horo_sign.show_horo

end
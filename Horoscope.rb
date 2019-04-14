require 'open-uri'

class Horoscope

	def initialize(zodiac_sign)
		self.zodiac_sign=zodiac_sign
	end

	attr_reader :zodiac_sign

	def zodiac_sign=(zodiac_sign)
		case zodiac_sign
		when "Овен","Овны"
			@zodiac_sign="aries"
		when "Телец","Тельцы"
			@zodiac_sign="taurus"
		when "Близнец","Близнецы"
			@zodiac_sign="gemini"
		when "Рак","Раки"
			@zodiac_sign="cancer"
		when "Лев","Львы"
			@zodiac_sign="leo"
		when "Дева","Девы"
			@zodiac_sign="virgo"
		when "Весы"
			@zodiac_sign="libra"
		when "Скорпион","Скорпионы"
			@zodiac_sign="scorpio"
		when "Стрелец","Стрельцы"
			@zodiac_sign="sagittarius"
		when "Козерог","Козероги"
			@zodiac_sign="capricorn"
		when "Водолей","Водолеи"
			@zodiac_sign="aquarius"
		when "Рыба","Рыбы"
			@zodiac_sign="pisces"
		else
			raise "Некорректный знак зодиака"	
		end
	end
#Первый сайт
	def first_site

		url= "https://horo.mail.ru/prediction/#{@zodiac_sign}/today/"

		page=open(url)

		page_text=page.read

		horoscope_array=page_text.scan(%r{article__item article__item_alignment_left article__item_html">.*<p>(.*)</p>.*<p>(.*)</p>}m)

		horoscope_string=horoscope_array.join.encode

		puts "Сайт horo.mail.ru \n #{horoscope_string}\n"

	end
#Второй сайт
	def second_site

		url= "http://1001goroskop.ru/?znak=#{@zodiac_sign}"

		page=open(url)
			#Читаем массив строк
		page_text=page.read
			#Регулярка для отбора строки
		horoscope_array=page_text.scan(%r{description">.*<p>(.*)</p>})
			#Раскодирование unicode->UTF-8
		horoscope_string=horoscope_array.join.encode
			#Вывод строки 
		puts "\n Сайт 1001goroskop.ru","#{horoscope_string}"

	end

	def third_site

		url= "https://www.obozrevatel.com/astro/#{@zodiac_sign}/"

		page=open(url)
			#Читаем массив строк
		page_text=page.read
			#Регулярка для отбора строки
		horoscope_array=page_text.scan(%r{astro-content__txt"><strong>.*</strong><p>(.*)</p})
			#Раскодирование unicode->UTF-8
		horoscope_string=horoscope_array.join.encode
			#Вывод строки 
		puts "\nСайт obozrevatel.com","#{horoscope_string}"

	end

	def fourth_site

		url= "https://horoscopes.rambler.ru/#{@zodiac_sign}/"

		page=open(url)
			#Читаем массив строк
		page_text=page.read
			#Регулярка для отбора строки
		horoscope_array=page_text.scan(%r{<span.*data-reactid="136">(.*)</span><a.*href="/})
			#Раскодирование unicode->UTF-8
		horoscope_string=horoscope_array.join.encode
			#Вывод строки 
		puts "\nСайт horoscopes.rambler.ru","#{horoscope_string}"
		
	end

	def fifth_site
		
		url= "http://www.astrolive.ru/horo/anti/#{@zodiac_sign}.html"

		page=open(url)
			#Читаем массив строк
		page_text=page.read
			#Регулярка для отбора строки
		horoscope_array=page_text.scan(%r{<p>.*<strong>.*</strong>(.*)</p>})
			#Раскодирование unicode->UTF-8
		horoscope_string=horoscope_array.join.encode
			#Вывод строки 
		puts "\nАнтиГороскоп:)","#{horoscope_string}"
	end

	def show_horo
		self.first_site
		self.second_site
		self.third_site
		self.fourth_site
		self.fifth_site
	end

end
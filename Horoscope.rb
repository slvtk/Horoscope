require 'open-uri'
require 'nokogiri'

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
			@zodiac_sign=false
		end
	end
#Первый сайт
	def first_site

		puts " Сайт horo.mail.ru"

		doc = Nokogiri::HTML(open("https://horo.mail.ru/prediction/#{@zodiac_sign}/today/"))
		
		doc.css('div[class="article__item article__item_alignment_left article__item_html"]').each do |text|

  	puts text.content.lstrip

		end

	end
#Второй сайт
	def second_site

		puts "\n Сайт 1001goroskop.ru"

		doc = Nokogiri::HTML(open("http://1001goroskop.ru/?znak=#{@zodiac_sign}"))

		doc.css('div[itemprop="description"]').each do |text|

  	puts text.content.lstrip

		end		

	end

	def third_site

		puts "\n Сайт obozrevatel.com"

		doc = Nokogiri::HTML(open("https://www.obozrevatel.com/astro/#{@zodiac_sign}/"))

		doc.css('div[class="astro-content__txt"] p').each do |text|

  	puts text.content.lstrip

		end		

	end

	def fourth_site

		puts "\n Сайт horoscopes.rambler.ru"

		doc = Nokogiri::HTML(open("https://horoscopes.rambler.ru/#{@zodiac_sign}/"))

		doc.css('div[class="_1dQ3"] span').each do |text|

  	puts text.content.lstrip

		end	

	end

	def fifth_site

		puts "\n Сайт orakul.com"

		doc = Nokogiri::HTML(open("https://orakul.com/horoscope/astrologic/more/#{@zodiac_sign}/today.html"))

		doc.css('div[class="horoBlock"] p').each do |text|

  	puts text.content.lstrip

		end	
		
	end

	def show_horo
		self.first_site
		self.second_site
		self.third_site
		self.fourth_site
		self.fifth_site
	end

end
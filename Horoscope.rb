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

	def show_horo
		k=0	
		#Наборы адрес сайта->критерий поиска на нем текста
		urls={
			"https://horo.mail.ru/prediction/#{@zodiac_sign}/today/"=>'div[class="article__item article__item_alignment_left article__item_html"]',
			"http://1001goroskop.ru/?znak=#{@zodiac_sign}"=>'div[itemprop="description"]',
			"https://www.obozrevatel.com/astro/#{@zodiac_sign}/"=>'div[class="astro-content__txt"] p',
			"https://horoscopes.rambler.ru/#{@zodiac_sign}/"=>'div[class="_1dQ3"] span',
			"https://orakul.com/horoscope/astrologic/more/#{@zodiac_sign}/today.html"=>'div[class="horoBlock"] p'
		}

		urls.each do |key,value|
			doc = Nokogiri::HTML(open(key.to_s))
			puts "\nСайт #{k+=1} : "
			doc.css(value.to_s).each do |text|
				puts text.content.lstrip
			end
		end
	end
end
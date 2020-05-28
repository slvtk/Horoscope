require 'open-uri'
require 'nokogiri'

class Horoscope

	attr_reader :zodiac_sign

	def initialize(zodiac_sign)
		self.zodiac_sign = zodiac_sign
	end

	def zodiac_sign=(zodiac_sign)

		signs = {
			"Овен" => "aries",
			"Телец" => "taurus",
			"Близнец" => "gemini",
			"Рак" => "cancer",
			"Лев" => "leo",
			"Дева" => "virgo",
			"Весы" => "libra",
			"Скорпион" => "scorpio",
			"Стрелец" => "sagittarius",
			"Козерог" => "capricorn",
			"Водолей" => "aquarius",
			"Рыба" => "pisces"
		}
		signs.default = false

		@zodiac_sign = signs[zodiac_sign]
	end

	def show_horo
		k = 0	
		#Наборы адрес сайта->критерий поиска на нем текста
		urls = {
			"https://horo.mail.ru/prediction/#{@zodiac_sign}/today/" => 'div[class="article__item article__item_alignment_left article__item_html"]',
			"http://1001goroskop.ru/?znak=#{@zodiac_sign}" => 'div[itemprop="description"]',
			"https://horoscopes.rambler.ru/#{@zodiac_sign}/" => 'div[class="_1dQ3"] span',
			"https://orakul.com/horoscope/astrologic/more/#{@zodiac_sign}/today.html" => 'div[class="horoBlock"] p'
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
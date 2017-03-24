class GamesController < ApplicationController
	include LudumDareGame
  def index
  	#puts 'Wow! What an awesome site: http://globalgamejam.org/2017/games/moon-bell'.scrapify
  	doc = Nokogiri::HTML(open('http://ludumdare.com/compo/ludum-dare-35/?action=preview&uid=56711'))
  	#teste = getTitle(doc)
  	puts doc.css('div div p').first
  	#puts "### Search for nodes by css"
  	#puts doc.css('body div div div div div div div div p').first
	#teste = "http://ludumdare.com/compo/ludum-dare-32/?action=preview&uid=50733".scrapify
	#teste1 = teste.slice(:images)
	#puts teste1
	#deleteKeys(teste1)
  	#doc.css('div a').each do |link|
  	#  puts link.content
  	#end
  end

  #def getTitle(doc)
 # 	return doc.css('div div p').first
 # end

  def filterHash(hash1)
  	teste2 = hash1[:images]
  	array = []
  	#puts teste2
  	teste2.each do |x|
  		if x.include? "shot"
  			array.push(x)
  		end
  	end
  	puts array
  end
end

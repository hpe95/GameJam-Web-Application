module LudumDareGame
	
	require 'nokogiri'
	require 'open-uri'

	def getTitle(url)
		doc = Nokogiri::HTML(open(url))
		ActionController::Base.helpers.strip_tags((doc.css('div div h2').first).to_html)
	end

	def getDescription(url)
		doc = Nokogiri::HTML(open(url))
		description = doc.css('body div div div div div div p')
		retorno = filterDescription(description)
	end


	def getImages(url)
		hashInfos = url.scrapify
		hashImages = hashInfos.slice(:images)
		# Returns only the links of the right images of the game
		arrayImages = filterHash(hashImages)

	end

	private
	def filterDescription(description)
		retorno = ""
		description.each do |link|
			if link.content != "Back to Browse Entries"
				retorno = link.content
				break
		  	end
		end
		retorno
	end

	def filterHash(hash1)
		temp = hash1[:images]
		array = []
		temp.each do |x|
			if x.include? "shot"
				array.push(x)
			end
		end
		return array
	end

end
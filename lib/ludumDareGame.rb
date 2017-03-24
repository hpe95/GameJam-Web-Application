module LudumDareGame
	
	def getTitle(doc)
		if doc.class == "Nokogiri::HTML::Document"
			puts "oi"
			return doc.css('div div p').first
		end
	end

	def getDescription(doc)
		if doc.class == "Nokogiri::HTML::Document"
			doc.css('div div h2').each do |link|
		  	if link.content != "Back to Browse Entries"
		  		return link.content
		  	end
		  	end
		end
	end

	def getImages(url)
		hashInfos = url.scrapify
		hashImages = hashInfos.slice(:images)
		# Returns only the link of the right images of the game
		arrayImages = filterHash(hashImages)

	end

	def filterHash(hash1)
		temp = hash1[:images]
		array = []
		#puts teste2
		temp.each do |x|
			if x.include? "shot"
				array.push(x)
			end
		end
		return array
	end

end
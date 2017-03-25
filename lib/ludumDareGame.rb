module LudumDareGame
	
	require 'nokogiri'
	require 'open-uri'

	@doc = ""
	
	def getTitle(url)
		@doc = Nokogiri::HTML(open(url))
		ActionController::Base.helpers.strip_tags((@doc.css('div div h2').first).to_html)
	end

	def getDescription(url)
		description = @doc.css('body div div div div div div p')
		filterDescription(description)
	end


	def getImages(url)
		hashInfos = url.scrapify
		hashImages = hashInfos.slice(:images)
		# Returns only the links of the right images of the game
		arrayImages = filterHash(hashImages)
		arrayImages.each do |str|
			str.gsub!(/png-crop-180-140.jpg/, "png-eq-900-500.jpg")
		end
		arrayImages  


	end

	private
	def filterDescription(description)
		descriptionFiltered = ""
		description.each do |link|
			if link.content != "Back to Browse Entries"
				descriptionFiltered = link.content
				break
		  	end
		end
		descriptionFiltered
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
class Organization < ActiveRecord::Base
	has_many :game_jams

	validates :site, presence: true	
end

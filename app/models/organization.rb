class Organization < ActiveRecord::Base
	has_many :game_jams
	validates :name, presence: true
	validates :site, presence: true	
end

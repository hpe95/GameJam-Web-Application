class Game < ActiveRecord::Base
	validates :url, presence: true
	validates :engineName, presence: true
	validates :year, presence: true
end

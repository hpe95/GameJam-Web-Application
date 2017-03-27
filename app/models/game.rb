class Game < ActiveRecord::Base
	validates :url, presence: true, :format => URI::regexp(%w(http https))
	validates :engineName, presence: true
	validates :year, numericality: {only_integer: true}

	has_many :comments
	belongs_to :game_jam
end

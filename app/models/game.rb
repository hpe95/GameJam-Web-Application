class Game < ActiveRecord::Base
	validates :url, presence: true, :format => URI::regexp(%w(http https))
	validates :engineName, presence: true
	validates :year, numericality: {only_integer: true}

	acts_as_votable

	has_many :comments
end

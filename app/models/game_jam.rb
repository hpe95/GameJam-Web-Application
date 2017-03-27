class GameJam < ActiveRecord::Base
	belongs_to :organization
	has_many :games
	validates :theme, presence: true
	validates :date, presence: true
	validates :version, numericality: { only_integer: true }
end

class GameJam < ActiveRecord::Base
	validates :theme, presence: true
	validates :date, presence: true
	validates :version, numericality: { only_integer: true }
end

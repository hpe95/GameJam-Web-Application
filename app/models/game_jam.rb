class GameJam < ActiveRecord::Base
	belongs_to :organization

	validates :theme, presence: true
	validates :date, presence: true
	validates :version, numericality: { only_integer: true }
end

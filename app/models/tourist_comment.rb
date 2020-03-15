class TouristComment < ApplicationRecord
	belongs_to :tourist
	belongs_to :guide

	validates :comment, presence: true
end

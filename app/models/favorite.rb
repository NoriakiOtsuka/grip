class Favorite < ApplicationRecord
	belongs_to :tourist, optional: true
	belongs_to :guide, optional: true
	belongs_to :blog
end
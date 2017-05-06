class State < ApplicationRecord
	has_many  :cities
	has_many  :compnies
	belongs_to :country
end

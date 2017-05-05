class State < ApplicationRecord
	has_many  :citys
	has_many  :compnies
	belongs_to :country
end

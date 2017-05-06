class State < ApplicationRecord
	has_many  :cities
	has_many  :companies
	belongs_to :country
end

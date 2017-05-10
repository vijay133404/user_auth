class City < ApplicationRecord
	has_many  :companies
	belongs_to :state

end

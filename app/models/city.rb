class City < ApplicationRecord
	has_many  :compnies
	belongs_to :state

end

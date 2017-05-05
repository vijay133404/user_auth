class Country < ApplicationRecord
	has_many  :compnies
	has_many  :states
end

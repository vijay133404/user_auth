class Country < ApplicationRecord
	has_many  :companies
	has_many  :states
	
end

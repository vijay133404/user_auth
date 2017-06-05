class Country < ApplicationRecord
	has_many  :companies
	has_many  :states
	acts_as_commentable
end

class City < ApplicationRecord
	has_many  :companies
	belongs_to :state
    acts_as_commentable
    
end

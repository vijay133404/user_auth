class Region < ApplicationRecord
	has_many :user, through: :user_regions 
	has_many :user_regions 
	 acts_as_commentable
end

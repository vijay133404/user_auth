class UserRegion < ApplicationRecord
	belongs_to :User
	belongs_to :Region
    acts_as_commentable
end

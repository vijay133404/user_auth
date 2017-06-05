class Company < ApplicationRecord
	belongs_to :country
	belongs_to :state
	belongs_to :city
	has_many  :places
	has_many  :users
	acts_as_votable
    acts_as_commentable
    has_many  :comments
end

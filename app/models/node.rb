class Node < ApplicationRecord
	has_many :places 
	belongs_to :user
    acts_as_votable
    acts_as_commentable
    has_many :comments
end

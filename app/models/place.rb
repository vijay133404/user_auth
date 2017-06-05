class Place < ApplicationRecord
	belongs_to :node
	belongs_to :company
	has_many :comments
	acts_as_commentable
	acts_as_votable
end

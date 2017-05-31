class Node < ApplicationRecord
	has_many :places 
	belongs_to :user
    acts_as_votable
end

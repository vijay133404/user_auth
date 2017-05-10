class Place < ApplicationRecord
	belongs_to :node
	belongs_to :company
end

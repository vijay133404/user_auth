class Image < ApplicationRecord
	belongs_to :imageable, polymorphic: true
	#mount_uploader :image_name, AvatarUploader
end

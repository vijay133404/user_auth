class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_region
  has_many :images,as: :imageable
  belongs_to :company
  belongs_to :UserRole
  belongs_to :region
   
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

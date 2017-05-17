class User < ApplicationRecord
  has_many :regions, through: :user_regions
  has_many :user_region
  has_many :images,as: :imageable
  belongs_to :company
  belongs_to :UserRole
  belongs_to :region

  #validates_presence_of :start_date, :end_date

  validate :end_date_is_after_start_date

        

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   private

   def end_date_is_after_start_date
  return if end_date.blank? || start_date.blank?

  if end_date < start_date
    errors.add(:end_date, "cannot be before the start date") 
  end 
end
         
end

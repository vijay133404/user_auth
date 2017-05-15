class User < ApplicationRecord
  has_many :regions, through: :user_regions
  has_many :user_region
  has_many :images,as: :imageable
  belongs_to :company
  belongs_to :UserRole
  belongs_to :region

  validate :end_date_after_start_date?

def end_date_after_start_date?
  if end_date < start_date
    errors.add :end_date, "must be after start date"
  end
end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

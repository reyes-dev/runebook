class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :image,
  :storage => :cloudinary
  has_one_attached :image
end

class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :image,
  :storage => :cloudinary
end

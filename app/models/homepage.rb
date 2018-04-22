class Homepage < ApplicationRecord
  mount_uploader :gambar_1, AvatarUploader
  mount_uploader :gambar_2, AvatarUploader
  mount_uploader :gambar_3, AvatarUploader
  has_many :tahapans,  dependent: :destroy 
  accepts_nested_attributes_for :tahapans, :reject_if => :all_blank, :allow_destroy => true
end

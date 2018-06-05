class Evaluasi < ApplicationRecord
  belongs_to :hibah
  belongs_to :user
  validates :keterangan, presence: true
  
  mount_uploader :file_upload, DocumentUploader
end

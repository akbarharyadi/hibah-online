class Pertimbangan < ApplicationRecord
  belongs_to :hibah
  belongs_to :user
  validates :keterangan, :status, presence: true
  def realisasi=(realisasi)
    self[:realisasi] = realisasi.to_s.delete('.').tr(',', '.') 
  end
  def status_pertimbangan
    if self.status = 0
      "Dapat Dipertimbangkan"
    elsif self.status = 1
      "Tidak Dapat Dipertimbangkan"
    end
  end
  mount_uploader :file, DocumentUploader
end

class Hibah < ApplicationRecord
  has_many :danas,  dependent: :destroy 
  accepts_nested_attributes_for :danas, :reject_if => :all_blank, :allow_destroy => true
  mount_uploader :gambar, AvatarUploader
  mount_uploader :proposal, DocumentUploader
  # attr_accessible :gambar_cache, :proposal_cache, :gambar_remove, :proposal_remove
  validates :nama, :alamat, :judul_kegiatan, :latar_belakang, :maksud_dan_tujuan, presence: true
  # validates_/attachment :gambar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  # validates_attachment :proposal, :content_type => {:content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

 before_save :default_values
  def default_values
    self.status = 0 if self.status.nil? # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end

  def status_hibah
    if self.status = 0
      "Proses seleksi"
    elsif self.status = 1
      "Proses disposisi"
    elsif self.status = 2
      "Proses verifikasi"
    elsif self.status = 3
      "Proses rekomendasi"
    elsif self.status = 4
      "Ditolak"
    elsif self.status = 5
      "HIBAH BANSOS Berjalan"
    end
  end
end

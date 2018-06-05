class Seleksi < ApplicationRecord
  belongs_to :hibah
  belongs_to :user
  validates :status, :keterangan, presence: true
  def status_seleksi
    if self.status = 0
      "Sesuai Persyaratan"
    elsif self.status = 1
      "Tidak Sesuai Persyaratan"
    end
  end
end

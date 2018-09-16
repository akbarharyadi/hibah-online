class Disposisi < ApplicationRecord
    belongs_to :hibah
    belongs_to :user
    validates :status, :keterangan, presence: true
    def status_disposisi
      if self.status = 0
        "Sesuai"
      elsif self.status = 1
        "Tidak Sesuai"
      end
    end
  end
  
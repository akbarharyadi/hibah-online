class Dana < ApplicationRecord
  belongs_to :hibah

  def jumlah=(jumlah)
    self[:jumlah] = jumlah.to_s.delete('.').tr(',', '.') 
  end
end


require 'date'
class Penetapan < ApplicationRecord
  belongs_to :hibah
  belongs_to :user
  validates :tgl_ketetapan, presence: true
  def tgl_ketetapan=(tgl_ketetapan)
    self[:tgl_ketetapan] = DateTime.parse(tgl_ketetapan).strftime('%Y-%m-%d')
  end
end
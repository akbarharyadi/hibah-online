class Distribusi < ApplicationRecord
  belongs_to :hibah
  belongs_to :dina
  belongs_to :user
  validates :dina_id, :keterangan, presence: true
end

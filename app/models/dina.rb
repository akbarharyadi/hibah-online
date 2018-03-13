class Dina < ApplicationRecord
  validates :code, :name, :address, presence: true
end

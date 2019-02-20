class HouseModel < ApplicationRecord
  validates :address, presence: true
end 
class Parking < ApplicationRecord
  validates :name, :parking_type, presence: true
  validates :name, uniqueness: true
  validates :parking_type, inclusion: { in: %w(AUTO MOTO DISCA),
    message: "%{value} is not a valid size" }
end

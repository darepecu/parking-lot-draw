class Applicant < ApplicationRecord
  validates :plate, :vehicle_type, presence: true
  validates :plate, uniqueness: true
  validates :vehicle_type, inclusion: { in: %w(AUTO MOTO DISCA),
    message: "%{value} is not a valid size" }
end

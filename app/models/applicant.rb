class Applicant < ApplicationRecord
  validates :plate, :vehicle_type, presence: true
  validates :plate, uniqueness: true
end

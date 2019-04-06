class Parking < ApplicationRecord
  validates :name, :parking_type, presence: true
  validates :name, uniqueness: true
end

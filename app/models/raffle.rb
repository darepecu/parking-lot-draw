class Raffle < ApplicationRecord
  belongs_to :applicant
  belongs_to :parking

  validates :applicant_id, presence: true, allow_blank: false
  validates :parking_id, presence: true, allow_blank: false

end

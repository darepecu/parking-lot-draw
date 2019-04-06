class Raffle < ApplicationRecord
  belongs_to :applicant
  belongs_to :parking
end

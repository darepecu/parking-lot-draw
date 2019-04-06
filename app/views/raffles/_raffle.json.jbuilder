json.extract! raffle, :id, :random_selected, :assigned, :applicant_id, :parking_id, :created_at, :updated_at
json.url raffle_url(raffle, format: :json)

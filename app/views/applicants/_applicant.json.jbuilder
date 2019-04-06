json.extract! applicant, :id, :plate, :vehicle_type, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)

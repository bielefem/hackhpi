json.extract! patient, :id, :firstname, :lastname, :birthday, :email, :publickey, :created_at, :updated_at
json.url patient_url(patient, format: :json)

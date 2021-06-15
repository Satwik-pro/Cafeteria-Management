json.extract! user, :id, :first_name, :last_name, :email, :ph_no, :password_digest, :role, :created_at, :updated_at
json.url user_url(user, format: :json)

json.extract! contact, :id, :name, :email, :object, :message, :created_at, :updated_at
json.url contact_url(contact, format: :json)

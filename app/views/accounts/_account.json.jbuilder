json.extract! account, :id, :account_number, :supplier_id, :created_at, :updated_at, :digit
json.url account_url(account, format: :json)

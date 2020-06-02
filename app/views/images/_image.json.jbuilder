json.extract! image, :id, :author, :description, :extension, :stream, :created_at, :updated_at
json.url image_url(image, format: :json)

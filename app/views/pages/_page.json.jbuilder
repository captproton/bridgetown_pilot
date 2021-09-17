json.extract! page, :id, :layout, :title, :categories, :body, :publish_at, :created_at, :updated_at
json.url page_url(page, format: :json)

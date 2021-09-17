json.extract! post, :id, :layout, :title, :categories, :body, :publish_at, :created_at, :updated_at
json.url post_url(post, format: :json)

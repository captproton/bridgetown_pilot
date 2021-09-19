json.extract! git_repo, :id, :email, :provider, :uid, :created_at, :updated_at
json.url git_repo_url(git_repo, format: :json)

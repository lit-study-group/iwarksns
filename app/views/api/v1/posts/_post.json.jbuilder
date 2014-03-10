json.(post, :id, :body, :created_at, :updated_at)

json.author { json.partial! post.author }

json.extract! review, :id, :title, :comments, :rating, :user_id, :attraction_id, :created_at, :updated_at
json.url review_url(review, format: :json)
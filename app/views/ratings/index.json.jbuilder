json.array!(@ratingas) do |rating|
  json.extract! rating, :id, :score
  json.url rating_url(rating, format: :json)
end

json.array!(@comments) do |comment|
  json.extract! comment, :id, :field, :rate
  json.url comment_url(comment, format: :json)
end

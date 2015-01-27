json.array!(@polls) do |poll|
  json.extract! poll, :id, :title
  json.url poll_url(poll, format: :json)
end

json.array!(@makers) do |maker|
  json.extract! maker, :id, :name
  json.url maker_url(maker, format: :json)
end

json.array!(@instruments) do |instrument|
  json.extract! instrument, :id, :name, :maker_id
  json.url instrument_url(instrument, format: :json)
end

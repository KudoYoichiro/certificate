json.array!(@maps) do |map|
  json.extract! map, :id, :engineer_id, :instrument_id, :operation_id, :status_id
  json.url map_url(map, format: :json)
end

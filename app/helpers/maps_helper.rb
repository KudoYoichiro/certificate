module MapsHelper
  def get_status(instrument_id, engineer_id, operation_id)
    map = Map.find_by('instrument_id = ? AND engineer_id = ? AND operation_id = ?',
    instrument_id, engineer_id, operation_id)
    
    result = map.blank? ? "" : map.status.name
    
  end
end

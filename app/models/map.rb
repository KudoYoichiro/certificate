class Map < ActiveRecord::Base
  belongs_to :engineer
  belongs_to :instrument
  belongs_to :operation
  belongs_to :status
end

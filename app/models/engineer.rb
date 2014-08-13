class Engineer < ActiveRecord::Base
  belongs_to :service_center
  has_many :maps
end

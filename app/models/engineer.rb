class Engineer < ActiveRecord::Base
  belongs_to :service_center
  has_many :maps
  
  validates :name,
  presence: true,
  uniqueness: true
end

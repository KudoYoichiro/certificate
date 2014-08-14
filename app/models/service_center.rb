class ServiceCenter < ActiveRecord::Base
  has_many :engineers
  
  validates :name,
  presence: true,
  uniqueness: true
end

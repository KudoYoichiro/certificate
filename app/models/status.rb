class Status < ActiveRecord::Base
  has_many :maps
  
  validates :name,
  presence: true,
  uniqueness: true
end

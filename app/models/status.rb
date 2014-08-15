class Status < ActiveRecord::Base
  has_many :maps, dependent: :destroy
  
  validates :name,
  presence: true,
  uniqueness: true
end

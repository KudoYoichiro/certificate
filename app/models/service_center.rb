class ServiceCenter < ActiveRecord::Base
  has_many :engineers, dependent: :destroy
  
  validates :name,
  presence: true,
  uniqueness: true
end

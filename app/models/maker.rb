class Maker < ActiveRecord::Base
  has_many :instruments, dependent: :destroy
  
  validates :name,
  presence: true,
  uniqueness: true
end

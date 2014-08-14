class Maker < ActiveRecord::Base
  has_many :instruments
  
  validates :name,
  presence: true,
  uniqueness: true
end

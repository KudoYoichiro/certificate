class Instrument < ActiveRecord::Base
  belongs_to :maker
  has_many :maps
  
  validates :name,
  presence: true,
  uniqueness: true
end

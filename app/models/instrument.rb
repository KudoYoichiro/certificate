class Instrument < ActiveRecord::Base
  belongs_to :maker
  has_many :maps, dependent: :destroy
  
  validates :name,
  presence: true,
  uniqueness: true
end

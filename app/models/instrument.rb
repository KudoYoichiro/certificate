class Instrument < ActiveRecord::Base
  belongs_to :maker
  has_many :maps
end

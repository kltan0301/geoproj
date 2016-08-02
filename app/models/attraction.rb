class Attraction < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :reviews
end

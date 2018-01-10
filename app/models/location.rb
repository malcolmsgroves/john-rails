class Location < ApplicationRecord

  belongs_to :toilet
  validates :lat, presence: true
  validates :lng, presence: true
  reverse_geocoded_by :lat, :lng

end

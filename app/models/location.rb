class Location < ApplicationRecord
  belongs_to :toilet
  validates :lat, presence: true
  validates :lng, presence: true

  def closest_toilet
    order_string = "ACOS(COS(RADIANS(lat)) * COS(RADIANS(#{self.lat})) * " +
                   "COS(RADIANS(lng) - RADIANS(#{self.lng})) + " +
                   "SIN(RADIANS(lat)) * SIN(RADIANS(#{self.lat})))"
    Location.order(order_string).map { |location| location.toilet }
  end
end

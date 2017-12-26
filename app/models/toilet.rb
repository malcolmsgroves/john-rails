class Toilet < ApplicationRecord
  has_one :location
  validates :name, presence: true
  accepts_nested_attributes_for :location

  # set per page limit for paginate
  self.per_page = 10

  def Toilet.close_to(location)
    order_string = "ACOS(COS(RADIANS(lat)) * COS(RADIANS(#{location.lat})) * " +
                   "COS(RADIANS(lng) - RADIANS(#{location.lng})) + " +
                   "SIN(RADIANS(lat)) * SIN(RADIANS(#{location.lat})))"
    Toilet.joins(:location).order(order_string)
  end
end

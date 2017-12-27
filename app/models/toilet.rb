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
    toilet_ids = Toilet.joins(:location).where("lat <> #{location.lat} OR lng <> #{location.lng}").order(order_string).limit(50).pluck(:id)
    toilet_ids = Toilet.joins(:location).where("lat = #{location.lat} AND lng = #{location.lng}").pluck(:id) + toilet_ids
    toilet_ids.collect { |id| Toilet.find(id) }
  end
  # had to rework the database query because acos was undefined when the location
  # matched the location of the toilet. This would be a worthwhile place to spend
  # more time doing work in the database since lots is done in ruby here
end

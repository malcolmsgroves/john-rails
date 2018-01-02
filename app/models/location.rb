class Location < ApplicationRecord
  acts_as_mappable
  belongs_to :toilet
  validates :lat, presence: true
  validates :lng, presence: true

  def closest_toilet
    Location.by_distance(:origin => self)
  end
end

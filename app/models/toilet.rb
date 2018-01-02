class Toilet < ApplicationRecord
  has_one :location
  validates :name, presence: true
  accepts_nested_attributes_for :location
  # acts_as_mappable :through => :location

  # set per page limit for paginate
  self.per_page = 10

  def Toilet.close_to(location)
    location.closest_toilet.map(&:toilet)
    #Toilet.by_distance(:origin => location)
  end

end

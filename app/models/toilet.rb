class Toilet < ApplicationRecord
  has_one :location, dependent: :destroy
  validates :name, presence: true
  accepts_nested_attributes_for :location


  # set per page limit for paginate
  self.per_page = 10

  def Toilet.close_to(location)
    toilet_ids = Location.near([location.lat, location.lng], 1000).select("id").limit(50).map(&:toilet_id)
    @toilets = Toilet.includes(:location).where(:id => toilet_ids)
  end

end

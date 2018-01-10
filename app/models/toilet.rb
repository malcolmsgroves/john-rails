class Toilet < ApplicationRecord
  has_one :location, dependent: :destroy
  validates :name, presence: true
  accepts_nested_attributes_for :location


  

  def Toilet.close_to(location)
    # toilet_ids = Location.near([location.lat, location.lng], 1000).select("id").limit(50).map(&:toilet_id)
    # @toilets = Toilet.includes(:location).where(:id => toilet_ids)
    @toilets = Location.near([location.lat, location.lng], 1000).joins(:toilet).limit(50).map { |loc| loc.toilet }
  end

end

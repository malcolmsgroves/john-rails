class Toilet < ApplicationRecord
  has_one :location, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  accepts_nested_attributes_for :location




  def Toilet.close_to(location)
    @toilets = Location.near([location.lat, location.lng], 5000).joins(:toilet).limit(50).map { |loc| loc.toilet }
  end

end

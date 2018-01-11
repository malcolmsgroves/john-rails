module ToiletsHelper
  def distance_in_words(miles)
    if miles > 10
      "#{miles.round} miles"
    elsif miles > 1
      "#{miles.round(1)} miles"
    else
      feet = miles * 5280
      "#{feet.round(-1)} feet"
    end
  end
end

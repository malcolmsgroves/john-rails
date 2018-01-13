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

  def toilet_image(type)
    type.downcase!
    case type
    when "portapotty"
      "portapotty.jpg"
    when "outhouse"
      "outhouse.png"
    when "public bathroom"
      "public.png"
    when "store"
      "store.png"
    else
      "unknown.png"
    end
  end

  def average_rating(toilet)
    average = toilet.reviews.average(:rating)
    average ? average.round(1) : "-"
  end

  def last_review_in_words(toilet)
    "Last review #{time_ago_in_words(toilet.reviews.last.created_at)} ago" if toilet.reviews.any?
  end
end

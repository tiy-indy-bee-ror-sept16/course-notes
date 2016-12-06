class Playground < ApplicationRecord
  # belongs_to :address
  acts_as_mappable
  before_validation :geocode_address, on: :create

  # def raw_address
  #   address.full_address
  # end

  def human_distance(other)
    distance_to(other).round(1)
  end

  def nearby(range=5)
    self.class.within(range, origin: [lat, lng]).where.not(id: id)
  end

  private
  def geocode_address
    geo=Geokit::Geocoders::MultiGeocoder.geocode(raw_address)
    errors.add(:base, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end
end

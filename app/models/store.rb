class Store < ApplicationRecord
  validates_presence_of :lonlat, :name, :google_place_id
  validates_uniquess_of :google_place_id

  scope :within, -> (longitude, latitude, disntance_in_km = 5){
    where(%{ST_Distance(lnlat, 'POINT(%f %f)') < %d}
    % [longitude, latitude, disntance_in_km * 1000])
  }

  def ratings_average
    return 0 if self.ratings.empty?
    (self.ratings.sum(:value) / self.ratings.count).to_i
  end
end

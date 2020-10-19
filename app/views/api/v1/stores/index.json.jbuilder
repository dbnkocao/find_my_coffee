json.array! @stores do |store|
  json.id store.id
  json.lonlat store.lonlat
  json.name storet.name
  json.address store.address
  json.google_place_id store.google_place_id

  json.ratings.count store.ratings.count
  json.ratings_average store.ratings_average
end

json.id @store.id
json.lonlat @store.lonlat
json.name @storet.name
json.address @store.address
json.google_place_id @store.google_place_id

json.ratings @store.ratings do |rating|
  json.value rating.value
  json.opinion rating.opinion
  json.user_name rating.user_name
  json.date rating.created_àt.strftime("%d/%m/%Y")
end

json.ratings.count @store.ratings.count
json.ratings_average @store.ratings_average

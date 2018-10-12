json.array! @product.each do |contact|
  json.name contact.name
  json.price contact.price
  json.image contact.image_url
  json.description contact.description
end
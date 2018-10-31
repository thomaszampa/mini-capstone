json.array! @carted_products.each do |carted_product|
  json.partial! "carted_products.json.jbuilder", carted_product: carted_product
end
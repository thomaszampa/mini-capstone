json.array! @carted_product.each do |carted_product|
  json.partial! "carted_products.json.jbuilder"
end

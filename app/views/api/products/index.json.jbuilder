json.array! @product.each do |product|
  json.partial! "product.json.jbuilder", product: product
end
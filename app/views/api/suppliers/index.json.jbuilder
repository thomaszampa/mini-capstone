json.array! @supplier.each do |supplier|
  json.partial! "supplier.json.jbuilder", supplier: supplier
end
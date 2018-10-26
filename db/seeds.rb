
user = User.new(
  name: "Thomas",
  email: "thomas@email.com",
  password: "password",
  password_confirmation: "password"
  )
user.save!

#

supplier = Supplier.new(
  name: "Reckless Records",
  email: "orders@reckless.com",
  phone_number: "(773) 235-3727"
  )
supplier.save!

supplier = Supplier.new(
  name: "Dusty Groove",
  email: "dg@dustygroove.com",
  phone_number: "(773) 342-5800"
  )
supplier.save!

#

product = Product.new(
  name: "Twin Peaks - Wild Onion LP", 
  price: 15,
  description: "Twin Peaks's 2014 sophomore release. Released via Grand Jury Records. Recorded at Observatory Studios. Mastered at Infrasonic Sound.",
  in_stock: true,
  supplier_id: 1, 
  )
product.save!

product = Product.new(
  name: "Ron Carter - All Blues LP", 
  price: 35,
  description: "Ron Carter's 1974 release. Released via CTI Records. Recorded at Van Gelder Studios.",
  in_stock: true,
  supplier_id: 1, 
  )
product.save!

product = Product.new(
  name: "Talking Heads - Speaking in Tongues LP", 
  price: 29,
  description: "Talking Heads' 1983 release. Released via Sire Record Company. Recorded at Blank Tapes NYC.",
  in_stock: true,
  supplier_id: 2, 
  )
product.save!


image = Image.new(
  url: "https://i1.cdn.hhv.de/catalog/475x475/00377/377436_2.jpg",
  product_id: 1
  )
image.save!

image = Image.new(
  url: "https://cdn-s3.allmusic.com/release-covers/400/0003/268/0003268950.jpg",
  product_id: 2
  )
image.save!

image = Image.new(
  url: "https://img.cdandlp.com/2014/11/imgL/117249020.jpg",
  product_id: 3
  )
image.save!


#

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new(
  name: "Twin Peaks - Wild Onion LP", 
  price: 15,
  image_url: "https://i1.cdn.hhv.de/catalog/475x475/00377/377436_2.jpg",
  description: "Twin Peaks's 2014 sophomore release. Released via Grand Jury Records. Recorded at Observatory Studios. Mastered at Infrasonic Sound."
  )
product.save

product = Product.new(
  name: "Ron Carter - All Blues LP", 
  price: 35,
  image_url: "https://cdn-s3.allmusic.com/release-covers/400/0003/268/0003268950.jpg",
  description: "Ron Carter's 1974 release. Released via CTI Records. Recorded at Van Gelder Studios.",
  )
product.save

product = Product.new(
  name: "Talking Heads - Speaking in Tongues LP", 
  price: 29,
  image_url: "https://img.cdandlp.com/2014/11/imgL/117249020.jpg",
  description: "Talking Heads' 1983 release. Released via Sire Record Company. Recorded at Blank Tapes NYC.",
  )
product.save
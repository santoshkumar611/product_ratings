# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |i|
	product =  Product.create(name: "Product mobile Redmi note  #{i}", description: "A smart phone with generation #{i}", thumbnail_image: "https://picsum.photos/200/300?random=#{i}" )


	5.times do |i|
		Review.create(reviewer_name: "Reviewer #{i}", content: "good product ", rating: rand(1..5), product: product)
	end
end
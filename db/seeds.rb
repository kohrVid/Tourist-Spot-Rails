# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
CSV.foreach(Rails.root.join("db/seeds_data/carousel.csv"), headers: true) do |row|
	Carousel.find_or_create_by(image_url: row[0], image_description: row[1])
end
require 'csv'
CSV.foreach(Rails.root.join("db/seeds_data/service.csv"), headers: true) do |row|
	Service.find_or_create_by(name: row[0], price: row[1], contents: row[2], guide: row[3], room: row[4], food: row[5] )
end
require 'csv'
CSV.foreach(Rails.root.join("db/seeds_data/faqs.csv"), headers: true) do |row|
	Faq.find_or_create_by(question: row[0], answer: row[1])
end


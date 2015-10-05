# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
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

#Adm
["id", "email", "encrypted_password", "reset_password_token", "reset_password_sent_at", "remember_created_at", "sign_in_count", "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip", "created_at", "updated_at", "admin", "braintree_customer_id"]
User.create!(
     	     email: "kohrVid@zoho.com",
	     password: <%= ENV["adm"] %>,
	     password_confirmation: <%= ENV["adm"]%>,
	     admin: true
	     )

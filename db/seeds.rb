# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

url = "https://www.dnd5eapi.co/api/spells"
json = open(url).read
objs = JSON.parse(json)

puts "Testing...#{objs["results"][1]["name"]} in the API. Did not cretae the spell yet."
puts "Testing...#{objs["results"][2]["name"]} in the API. Did not create the spell yet."
puts "Cleaning up db"
Spell.destroy_all
puts "Db is clean"


# objs["results"].each do |key|
#   spell = Spell.create!(
#     name: "#{key["name"]}"
#     )
#   puts "#{spell.name} created!"
# end

5.times do |key|
  key + 1
  spell = Spell.create!(
    name: "#{objs["results"][key]["name"]}"
    )
  puts "#{spell.name} created!"
end

puts "#{Spell.count} spells created!"

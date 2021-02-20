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

puts "Cleaning up db"
Spell.destroy_all
puts "Db is clean"


# objs["results"].each do |key|
#   spell = Spell.create!(
#     name: "#{key["name"]}"
#     )
#   puts "#{spell.name} created!"
# end

5.times do
  spell = Spell.create!(
    name: "#{objs["results"].first}"
    )
  puts "#{spell.name} created!"
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Proposition.delete_all
Proposition.create!(
  text: "My proposition!",
  sha1: "fe1d2c8da97cd63ff28f9a1a3598fe29def216dd"
)
Argument.delete_all
Argument.create!(
  title: "My Argument ^_^",
  sha1: "50250211801dabf9cbf0e574af270ba2c3fe83cb",
  propositions: [
    Proposition.create!({ text: "The first premise!", sha1: "37ca8beaaac1d1b8412c9fb1fd73e524c9862ebe" }),
    Proposition.create!({ text: "The second premise!", sha1: "29da59119a5c3cec4f7b339433e8931ea99771cf" }),
    Proposition.create!({ text: "The conclusion.", sha1: "3940b2a6a3d5778297f0e37a06109f9d3dcffe6d" })
])

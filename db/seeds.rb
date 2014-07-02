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
  sha1: "50250211801dabf9cbf0e574af270ba2c3fe83cb"
)

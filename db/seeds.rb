# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

1000.times do
  r = Random.new
  publickey = ""

  if r.rand(0..1) == 1
    publickey = FFaker::Lorem.sentence
  end

  Patient.create(firstname: FFaker::Name.first_name, lastname: FFaker::Name.last_name, birthday: FFaker::Time.date, email: FFaker::Internet.email, publickey: publickey)
end
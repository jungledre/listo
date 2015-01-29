# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.connection.execute("TRUNCATE TABLE Activities RESTART IDENTITY")

Activity.create([
  { name: 'Get Coffee', category_id: '4bf58dd8d48988d1e0931735' },
  { name: 'Grab a Drink', category_id: '4bf58dd8d48988d116941735' },
  { name: 'Take a Walk', category_id: '4bf58dd8d48988d163941735' },
  { name: 'Visit a Bookstore', category_id: '4bf58dd8d48988d114951735' },
  { name: 'Visit a Museum', category_id: '4bf58dd8d48988d181941735' },
  { name: 'Play Board Games', category_id: '4bf58dd8d48988d18d941735' },
  { name: 'Grocery Shopping', category_id: '4bf58dd8d48988d118951735' },
  { name: 'Out to Eat', category_id: '4d4b7105d754a06374d81259' },
  { name: 'Visit a Park', category_id: '4d4b7105d754a06377d81259' },
  { name: 'Record Shopping', category_id: '4bf58dd8d48988d10d951735' },
  { name: 'Watch a Movie', category_id: '4bf58dd8d48988d17f941735' },
  { name: 'Shopping', category_id: '4d4b7105d754a06378d81259, 4bf58dd8d48988d103951735' },
  { name: 'Bike Riding', category_id: '4bf58dd8d48988d163941735' }
  ])

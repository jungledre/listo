# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.connection.execute('TRUNCATE TABLE Activities RESTART IDENTITY')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE Users RESTART IDENTITY')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE Activities_users RESTART IDENTITY')


Activity.create([
  { name: 'Get Coffee', category_id: '4bf58dd8d48988d1e0931735,4bf58dd8d48988d16d941735,4bf58dd8d48988d147941735' },
  { name: 'Grab A Drink', category_id: '4bf58dd8d48988d116941735,4bf58dd8d48988d11e941735,4d4b7105d754a06376d81259' },
  { name: 'Take A Walk', category_id: '4bf58dd8d48988d163941735,4d4b7105d754a06377d81259,4d4b7105d754a06374d81259' },
  { name: 'Visit A Bookstore', category_id: '4bf58dd8d48988d114951735,52f2ab2ebcbc57f1066b8b30,4bf58dd8d48988d101951735' },
  { name: 'Visit A Museum', category_id: '4bf58dd8d48988d181941735,4bf58dd8d48988d12d941735,4deefb944765f83613cdba6e' },
  { name: 'Play Board Games', category_id: '4bf58dd8d48988d18d941735,4bf58dd8d48988d1e1931735,4bf58dd8d48988d1e0931735' },
  { name: 'Grocery Shopping', category_id: '4bf58dd8d48988d118951735,52f2ab2ebcbc57f1066b8b46,4bf58dd8d48988d1f9941735' },
  { name: 'Out To Eat', category_id: '4bf58dd8d48988d1c4941735,4bf58dd8d48988d14e941735,4d4b7105d754a06374d81259' },
  { name: 'Visit A Park', category_id: '4bf58dd8d48988d163941735,4d4b7105d754a06377d81259,4deefb944765f83613cdba6e' },
  { name: 'Record Shopping', category_id: '4bf58dd8d48988d10d951735,4bf58dd8d48988d1fe941735,4bf58dd8d48988d1e5931735' },
  { name: 'Watch A Movie', category_id: '4bf58dd8d48988d17f941735,4bf58dd8d48988d1f2931735,4d4b7104d754a06370d81259' },
  { name: 'Shopping', category_id: '4bf58dd8d48988d103951735,4bf58dd8d48988d128951735,4d4b7105d754a06378d81259' },
  { name: 'Bike Riding', category_id: '4bf58dd8d48988d163941735,4bf58dd8d48988d12f941735,4d4b7105d754a06377d81259' }
  ])

User.create([
  { first_name:'Viggo',
    last_name:'Mortensen',
    email:'Viggo@gmail.com',
    password:'listowdi',
    password_confirmation:'listowdi',
    bio:'Heyyyy',
    location:'Pioneer Square, Seattle, WA'},

  { first_name:'Liv',
    last_name:'Tyler',
    email:'Liv@gmail.com',
    password:'listowdi',
    password_confirmation:'listowdi',
    bio:'From the ashes, a fire shall be woken. A light from the shadow shall spring.',
    location:'Pioneer Square, Seattle, WA'},

  { first_name:'Elijah',
    last_name:'Wood',
    email:'Elijah@gmail.com',
    password:'listowdi',
    password_confirmation:'listowdi',
    bio:'I wish the Ring had never come to me. I wish none of this had happened.',
    location:'Pioneer Square, Seattle, WA'},

  { first_name:'Orlando',
    last_name:'Bloom',
    email:'Orlando@gmail.com',
    password:'listowdi',
    password_confirmation:'listowdi',
    bio:'What\'s Up, Seattle',
    location:'Pioneer Square, Seattle, WA'}
])

activity = Activity.find_by_id 2

User.first.activities << activity
User.second.activities << activity
User.third.activities << activity

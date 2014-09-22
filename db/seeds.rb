# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# puts 'Seeding users...'
# User.destroy_all
cnx = ActiveRecord::Base.connection
cnx.execute "TRUNCATE users, advertisers, campaigns RESTART IDENTITY"

administrator = User.create!(
  first_name: 'test',
  last_name: 'test',
  role: 'administrator',
  email: 'administrator@adserver.com',
  password: 'administrator',
  password_confirmation: 'administrator'
)
user = User.create!(
  first_name: 'test',
  last_name: 'test',
  role: 'user',
  email: 'user_test@adserver.com',
  password: 'user_test',
  password_confirmation: 'user_test'
)

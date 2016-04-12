# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.find_by_email("admin@mail.com").nil?
  User.create!({:email => "admin@mail.com", :password => "testpass", :password_confirmation => "testpass", :roles => :admin})
  User.create!({:email => "editor@mail.com", :password => "testpass", :password_confirmation => "testpass", :roles => :editor})
  User.create!({:email => "user@mail.com", :password => "testpass", :password_confirmation => "testpass"})
end

unless Category.all.any?
  Category.create!({:title => "First category"})
  Category.create!({:title => "Second category"})
  Category.create!({:title => "Third category"})
end

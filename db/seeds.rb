# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.find_by_email("warlockit@yandex.ru").nil?
  user = User.create!({:email => "warlockit@yandex.ru", :password => "testpass", :password_confirmation => "testpass"})
  user.roles = :admin
  user.save
end

unless Category.all.any?
  Category.create!({:title => "First category"})
  Category.create!({:title => "Second category"})
  Category.create!({:title => "Third category"})
end

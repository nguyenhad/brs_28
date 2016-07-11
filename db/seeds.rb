# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)\
User.create!(name: "nghiantt", email: "abc@gmail.com",
  password: "123456", password_confirmation: "123456", user_role: 0)

5.times do |u|
  User.create! name: "User" + (u+1).to_s,
  email: "user#{u+1}@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  user_role: 1
end

5.times do |n|
  Book.create! title: "Hay cham soc me" + (n+1).to_s,
    author: "Kyung Sook",
    description: "Please look after your mom",
    publish_date: "2013/1/1",
    pages: 200,
    isbn: "codebook" + (n+1).to_s,
    picture: "/assets/momy.jpg",
    average_rate: 0,
    category_id: 1
  end

5.times do |n|
  Book.create! title: "Nha gia kim" + (n+1).to_s,
    author: "Paulo Coelho",
    description: "Nha gia kim",
    publish_date: "2015/1/1",
    pages: 200,
    isbn: "codebks" + (n+1).to_s,
    average_rate: 0,
    category_id: 1
  end

Category.create! name: "Novel"

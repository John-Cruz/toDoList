# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "test", email:"test@email.com", password: "password")

user = User.last

Activity.create!(name: "Get Groceries", description: "Go to the Grocery Store",
    due_date: (Time.now + 1.day), priority: 1, user_id: user.id )
Activity.create!(name: "Mow the Grass", due_date: (Time.now + 2.day), priority: 2,
    user_id: user.id  )
Activity.create!(name: "Clean Bathroom", description: "Shower and toilet need to be cleaned",
    due_date: (Time.now + 3.day), priority: 3, user_id: user.id  )

Category.create!(name:"Recreation")
Category.create!(name:"Home")
Category.create!(name:"Groceries")
Category.create!(name:"Work")

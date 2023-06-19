# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create([{ name: "Jerry" }, { name: "Tom" }, { name: "Joe" }, { name: "Dave" }])
ClockedIn.create({start_date: 1.days.from_now, end_date: DateTime.yesterday, user: users.first})
ClockedIn.create({start_date: DateTime.yesterday, end_date: DateTime.current, user: users[1]})
Follow.create({follower: users.last, following: users.first})
Follow.create({follower: users[3], following: users.first})
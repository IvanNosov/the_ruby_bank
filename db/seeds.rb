# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(email: "test@test.com", password: "123123")
user2 = User.create(email: "test1@test.com", password: "123123")

user1.bank_account.update(balance: 1000)
user2.bank_account.update(balance: 500)


Transaction.create(amount: 100, sender: user1, recipient: user2, success: true)
Transaction.create(amount: 20, sender: user2, recipient: user1, success: false)
Transaction.create(amount: 80, sender: user1, recipient: user2, success: true)
Transaction.create(amount: 19, sender: user2, recipient: user1, success: true)
Transaction.create(amount: 400, sender: user1, recipient: user2, success: false)
Transaction.create(amount: 10, sender: user2, recipient: user1, success: true)

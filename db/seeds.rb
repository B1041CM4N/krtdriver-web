# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create(
    email: "ignacio@krt.cl",
    password: "123123123",
    password_confirmation: "123123123",
    status: 1
)

User.create(
    email: "ramon@krt.cl",
    password: "123123123",
    password_confirmation: "123123123",
    status: 1
)

User.create(
    email: "gabriel@krt.cl",
    password: "123123123",
    password_confirmation: "123123123",
    status: 1

)
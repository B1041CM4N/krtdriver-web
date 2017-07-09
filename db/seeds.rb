# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
#Driver.destroy_all

# ADMINS

# enum role: [:admin, :provider, :owner]

# User.create(
#   email: 'ignacio@krt.cl',
#   password: '123123123',
#   password_confirmation: '123123123',
#   status: 1,
#   role: 0
# )
# 
# User.create(
#   email: 'ramon@krt.cl',
#   password: '123123123',
#   password_confirmation: '123123123',
#   status: 1,
#   role: 0
# )
# 
# User.create(
#   email: 'gabriel@krt.cl',
#   password: '123123123',
#   password_confirmation: '123123123',
#   status: 1,
#   role: 0
# )

# TIENDAS

# 30.times do
#   User.create(
#     email: Faker::Internet.email,
#     password: 'tienda123',
#     password_confirmation: 'tienda123',
#     status: 1,
#     role: 2
#   )
# end



## Proveedores

# 30.times do
#   User.create(
#     email: Faker::Internet.email,
#     password: 'driver123',
#     password_confirmation: 'driver123',
#     status: 1,
#     role: 1
#   )
# end

# 50.times do
#   Provider.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     rut: Faker::Code.isbn,
#     store_id: Store.all.sample,
#     address_id: Address.all.sample,
#     email: Faker::Internet.email,
#     vehicle_id: Vehicle.all.sample,
#     segment_id: Segment.all.sample,
#     password: 'provider123',
#     bank_account_id: BankAccount.all.sample
#   )
# end

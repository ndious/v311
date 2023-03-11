# typed: strict

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@customers = Customer.create([{ name: 'Lo', login: 'laura' }, { name: 'Ni', login: 'dious' }])

@vaults = Room.create([{ customer: @customers.first }, { customer: @customers.last }])

code = Code.generate_code(true, @customers.last)
container = Container.create(name: 'test', customer: @customers.last, code:, room: @vaults.last)

(1..10).each_with_index do |_e, index|
  code = Code.generate_code(true, @customers.last)
  Item.create({ name: "Dress #{index}", code:, container:, customer: @customers.last })
end

%w[5E6GOR 3VMT34 V3UGGW 40ZKTP].each { |value| Code.create(value:, customer: @customers.first) }

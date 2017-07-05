# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(
  email: "bluelionjr@gmail.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  confirmed_at: Date.today
)

User.create!(
  email: "jrmitchelllist@gmail.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  confirmed_at: Date.today
)

User.create!(
  email: "pokeygray@yahoo.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  confirmed_at: Date.today
)


# Create Registered Applications
7.times do
  RegisteredApplication.create!(
    user_id: User.all.sample.id,
    title: Faker::StarWars.character,
    url: Faker::Internet.url,
  )
end

#Create Events
50.times do
  Event.create!(
  name: Faker::ChuckNorris.fact,
  registered_application_id: RegisteredApplication.all.sample.id
  )
end


registered_applications = RegisteredApplication.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"

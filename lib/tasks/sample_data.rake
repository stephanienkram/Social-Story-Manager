namespace :db do
    desc "Fill database with sample data"
    task populate: :environment do
        admin = Author.create!(username: "name",
                    email: "name@name.com",
                    password: "mememe",
                    password_confirmation: "mememe")
        admin.toggle!(:admin)
        99.times do |n|
            name = Faker::Name.name
            email = "name-#{n+1}@name.com"
            password = "password"
            summary = Faker::Lorem.sentences(5).join(" ")
            location = Faker::Lorem.words(1).to_s.capitalize
            Author.create!(username: name,
                           email: email,
                           password: password,
                           password_confirmation: password,
                           summary: summary,
                           location: location)
        end
    end
end
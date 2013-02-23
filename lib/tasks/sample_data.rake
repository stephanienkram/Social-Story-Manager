namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_authors
    make_statuses
    make_projects
    make_relationships
  end
end

def make_authors
  admin = Author.create!(username:     "name",
                       email:    "name@name.com",
                       password: "mememe",
                       password_confirmation: "mememe")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "name-#{n+1}@name.com"
    password  = "password"
    location = Faker::Lorem.words(2)[0].capitalize
    summary = Faker::Lorem.sentence(5)
    Author.create!(username:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password,
                 location: location,
                 summary: summary)
  end
end

def make_statuses
  authors = Author.all(limit: 6)
  20.times do
    content = Faker::Lorem.sentence(5)
    authors.each { |author| author.author_statuses.create!(status: content) }
  end
end

def make_projects
  authors = Author.all
  5.times do
  	title = Faker::Lorem.words(1)[0].capitalize
    content = Faker::Lorem.sentence(2)
    authors.each { |author| author.projects.create!(name: content, elevator: content) }
  end
end

def make_relationships
  authors = Author.all
  author  = authors.first
  followed_authors = authors[2..50]
  followers      = authors[3..40]
  followed_authors.each { |followed| author.follow!(followed) }
  followers.each      { |follower| follower.follow!(author) }
end
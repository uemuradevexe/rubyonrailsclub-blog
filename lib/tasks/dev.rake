namespace :dev do
  desc "Add articles to the database"
  task add_articles: :environment do
    50.times do |i|
      Article.create(
        title: Faker::Lorem.sentence.delete("."),
        body: Faker::Lorem.paragraphs(number: rand(100..200)).join("\n\n")
      )
    end
  end
end

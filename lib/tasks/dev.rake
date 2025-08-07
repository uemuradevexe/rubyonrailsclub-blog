namespace :dev do
  desc "Add articles to the database"
  task add_articles: :environment do
    show_spinner("Adding articles to the database") {add_articles} #<= isso seria o do
    
  end

  def add_articles
    50.times do |i|
      Article.create(
        title: Faker::Lorem.sentence.delete("."),
        body: Faker::Lorem.paragraphs(number: rand(100..200)).join("\n\n")
      )
    end
  end

  def show_spinner(msg_start = "Loading...", msg_end = "Done")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :classic)
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
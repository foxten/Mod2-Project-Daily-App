# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Book.destroy_all
Music.destroy_all
SleepingPattern.destroy_all
ShoppingTrip.destroy_all 
UserBook.destroy_all
UserMusic.destroy_all

20.times do
  
User.create(name: Faker::Name.name, password: Faker::Name.name )

end

20.times do
Book.create(title: Faker::Book.title, genre: Faker::Book.genre, author: Faker::Book.author, release_date: Faker::Date.backward(days: 300))
end

20.times do
Music.create(title: Faker::Music.album, playlist: Faker::Quote.singular_siegler, artist: Faker::Music.band, time_of_song: Faker::Number.decimal(l_digits: 2))
end

50.times do
SleepingPattern.create(location: Faker::Address.city, average_sleep: Faker::Number.within(range: 1..10), position: Faker::Types.rb_string, grade: Faker::Number.between(from: 1, to: 10) , date: Faker::Date.between(from: 30.days.ago, to: Date.today), user_id: User.all.sample.id)
end

50.times do
ShoppingTrip.create(store: Faker::Company.name, receipt_total: Faker::Number.decimal(l_digits: 2), online: Faker::Boolean.boolean, date: Faker::Date.between(from: 30.days.ago, to: Date.today), user_id: User.all.sample.id)
end

50.times do
UserBook.create(user_id: User.all.sample.id, book_id: Book.all.sample.id)
end 

50.times do
UserMusic.create(user_id: User.all.sample.id, music_id: Music.all.sample.id)
end 
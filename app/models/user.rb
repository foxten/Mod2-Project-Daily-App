class User < ApplicationRecord
    has_many :user_musics
    has_many :musics, through: :user_musics

    has_many :user_books
    has_many :books, through: :user_books

    has_many :sleeping_patterns
    has_many :shopping_trips
end

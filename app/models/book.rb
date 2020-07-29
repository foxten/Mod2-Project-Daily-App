class Book < ApplicationRecord
    has_many :user_books, dependent: :destroy
    has_many :users, through: :user_books
    has_many :musics, through: :users
    validates :title, presence: true
    validates :author, presence: true

    def self.all_genres
        Book.all.select('distinct(genre)')
    end

    def one_less_shelf(user_info)
        UserBook.where(user_id: user_info.id).find_by(book_id: self.id).destroy
    end

    def included(user_info)
        user_info.books.find_by(id: self.id)
    end
end

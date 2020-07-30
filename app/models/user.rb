class User < ApplicationRecord
    has_many :user_musics
    has_many :musics, through: :user_musics

    has_many :user_books
    has_many :books, through: :user_books

    has_many :sleeping_patterns
    has_many :shopping_trips

    validates :name, presence: true, uniqueness: true
    validates :password, length: {minimum: 6}

    has_secure_password

    def most_recent_transactions
        self.shopping_trips.sort_by{|trip| trip.date}.last(5)
    end

    def last_seven_sleep_entries
        self.sleeping_patterns.sort_by{|entry| entry.date}.last(7)
    end

    def total
        self.most_recent_transactions.map{|trip| trip.receipt_total}.sum
    end

    def average_sleep_rating
        ratings = self.last_seven_sleep_entries.map{|entry| entry.grade}
        (ratings.sum.to_i) / (ratings.count) 
    rescue ZeroDivisionError
        0
            
    end

end

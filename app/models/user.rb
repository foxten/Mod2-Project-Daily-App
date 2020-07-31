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

    def sorted_transactions
        self.shopping_trips.sort_by{|trip| trip.date}
    end

    def sorted_sleep_data
        sleeping_patterns.sort_by{|entry| entry.date}
    end

    def most_recent_transactions
        self.sorted_transactions.last(5)
    end

    def last_seven_sleep_entries
        self.sorted_sleep_data.last(7)
    end

    def total
        self.most_recent_transactions.map{|trip| trip.receipt_total}.sum
    end

    def average_sleep_rating
        ratings = self.last_seven_sleep_entries.map{|entry| entry.grade}
        ((ratings.sum.to_f) / (ratings.count)).round(2)
        rescue ZeroDivisionError
        0
    end

    def monthly_trips
        self.shopping_trips.sort_by{|trip| trip.date.month}.group_by{|trip| trip.date.month}
    end

    def most_expensive
        self.shopping_trips.sort_by{|trip| trip.receipt_total}.last
    end

    def best_rest
        self.sleeping_patterns.sort_by{|entry| entry.grade}.last
    end

    def longest_nights_sleep
        self.sleeping_patterns.sort_by{|entry| entry.average_sleep}.last
    end

    def hours_of_sleep_per_month
        self.sleeping_patterns.group_by{|entry| entry.date.month}
    end

end

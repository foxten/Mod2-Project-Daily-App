class Music < ApplicationRecord
    has_many :user_musics
    has_many :users, through: :user_musics
    has_many :books, through: :users

    def playlist_partners
        Music.all.where(playlist: self.playlist)
    end

    def included(user_info)
        user_info.musics.find_by(id: self.id)
    end

    def one_less_playlist(user_info)
        UserMusic.where(user_id: user_info.id).find_by(music_id: self.id).destroy
    end
end

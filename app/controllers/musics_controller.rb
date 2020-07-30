class MusicsController < ApplicationController
    
    def index
        @musics = Music.all
    end

    def show
        @music = Music.find(params[:id])
    end

    def new
        @music = Music.new
    end    
    #create
    def create
        @music = Music.create(music_params)
        UserMusic.create(user_id: @current_user.id, music_id: @music.id)
        redirect_to music_path(@music)
    end    
    #edit
    def edit
        @music = Music.find(params[:id])
    end    
    #update
    def update 
        @music = Music.find(params[:id])
        @music.update(music_params)
        redirect_to music_path(@music)
    end    

    def add_a_song
        @music = Music.find(params[:id])
        UserMusic.create(music_id: @music.id, user_id: @current_user.id)
        redirect_to user_profile_path
    end

    def playlist
        @music = Music.find(params[:id])
    end

    def remove_from_my_playlists
        @music = Music.find(params[:id])
        @music.one_less_playlist(@current_user)
        redirect_to user_profile_path
    end

    #delete
    def destroy
        @music = Music.find(params[:id])
        @music.destroy
        redirect_to musics_path
    end    
    ##private
    #music_params
    private

    def music_params
        params.require(:music).permit(:title, :artist, :playlist, :time_of_song)
    end  
end

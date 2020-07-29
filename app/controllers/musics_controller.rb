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
        redirect_to musics_path(@musics)
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

class Api::SongsController < ApplicationController
    def create
      song = Song.new(song_params)
      if song.save
        render json: song, status: :created
      else
        render json: { errors: song.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def song_params
      params.require(:song).permit(:title, :artist)
    end
  end
  
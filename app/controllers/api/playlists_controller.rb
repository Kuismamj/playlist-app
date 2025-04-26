class Api::PlaylistsController < ApplicationController
    def index
      playlists = Playlist.all # Hakee kaikki soittolistat
      render json: playlists # Palauttaa soittolistat JSON-muodossa
    end
  
    def show
      playlist = Playlist.find(params[:id]) # Hakee yksittäisen soittolistan ID:n perusteella
      render json: playlist.to_json(include: :songs)
    end
  
    def create
      playlist = Playlist.new(playlist_params) # Luo uuden soittolistan käyttäjän syöttämistä tiedoista
      if playlist.save
        render json: playlist, status: :created # Palauttaa soittolistan JSON-muodossa
      else
        render json: { errors: playlist.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def add_song
      playlist = Playlist.find(params[:id]) # Hakee soittolistan ID:n perusteella
      song = Song.find(params[:song_id]) # Hakee biisin ID:n perusteella
  
      # Lisätään biisi soittolistalle
      playlist.songs << song 
  
      if playlist.save
        render json: playlist, status: :ok
      else
        render json: { error: 'Song could not be added to playlist' }, status: :unprocessable_entity
      end
    end

    def remove_song
        playlist = Playlist.find(params[:id])
        song = Song.find(params[:song_id])
      
        if playlist.songs.delete(song)
          render json: { message: 'Song removed from playlist' }, status: :ok
        else
          render json: { error: 'Could not remove song from playlist' }, status: :unprocessable_entity
        end
      end
      
  
    def update
      playlist = Playlist.find(params[:id]) # Hakee soittolistan
      if playlist.update(playlist_params) # Päivittää soittolistan tiedot
        render json: playlist
      else
        render json: { errors: playlist.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      playlist = Playlist.find(params[:id]) # Hakee soittolistan
      playlist.destroy # Poistaa soittolistan
      render json: { message: "Playlist deleted successfully" }, status: :ok
    end
  
    private
  
    def playlist_params
      params.require(:playlist).permit(:name, :description) # Varmistaa että nämä tiedot lähetetään oikein
    end
  end
  
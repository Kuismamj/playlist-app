class CreateJoinTablePlaylistsSongs < ActiveRecord::Migration[8.0]
  def change
    create_join_table :playlists, :songs do |t|
      # t.index [:playlist_id, :song_id]
      # t.index [:song_id, :playlist_id]
    end
  end
end

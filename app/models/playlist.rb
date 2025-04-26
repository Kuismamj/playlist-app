class Playlist < ApplicationRecord
    has_and_belongs_to_many :songs # Tämä yhdistää Playlist-mallin ja Song-mallin
end

Tämä on yksinkertainen soittolista-API Ruby on Railsilla.

Teknologiat

- Ruby 3.2.2
- Rails 7.1.2
- PostgreSQL 14+

Asennus:

1. Kloonaa projekti:

```bash
git clone <tämän repo-osoite>
cd projektin_kansioon

2. Asenna riippuvuudet:
bundle install

3. Luo ja aja tietokanta:
rails db:create
rails db:migrate

4.
-Servu päälle komennolla "rails server"
-PostgreSQL asennettuna koneelle ja päällä
-Postmanista API kutsut

API-endpointit:
-Lisää biisi-
POST http://localhost:3000/api/songs

BODY -> RAW -> JSON
{
"song": {
"title": "Song Title",
"artist": "Artist Name"
}
}

-Lisää biisi soittolistalle-
POST http://localhost:3000/api/playlists/(SOITTOLISTAN_ID)/add_song

BODY -> RAW -> JSON
{
"song_id": biisin id
}

-Katso soittolistan sisältö-
GET http://localhost:3000/api/playlists/(SOITTOLISTAN_ID)

-Luo soittolista-
POST /api/playlists
{
"playlist": {
"name": "My New Playlist",
"description": "Kokoelma parhaista biiseistä!"
}
}

-Poista biisi soittolistalta-
POST /api/playlists/:id/remove_song
{
"song_id": 1
}

-Päivitä soittolistan tiedot-
PUT /api/playlists/:id
{
"playlist": {
"name": "Updated Playlist Name",
"description": "Updated playlist description"
}
}

-Poista soittolista-
DELETE /api/playlists/:id
```

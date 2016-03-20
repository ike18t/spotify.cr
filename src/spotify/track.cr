require "./resource"

module Spotify
  class TrackAlbum
    JSON.mapping({
      album_type:    String,
      external_urls: Hash(String, String),
      href:          String,
      id:            String,
      images:        Array(Image),
      name:          String,
      type:          String,
      uri:           String,
    })
  end

  class TrackArtist
    JSON.mapping({
      external_urls: Hash(String, String),
      href:          String,
      id:            String,
      name:          String,
      type:          String,
      uri:           String,
    })
  end

  class Track < Resource
    @@resource = "tracks"
    JSON.mapping({
      album:        TrackAlbum,
      artists:      Array(TrackArtist),
      id:           String,
      name:         String,
      popularity:   Int32,
      href:         String,
      track_number: Int32,
    })
  end
end

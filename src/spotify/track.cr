require "./resource"

module Spotify
  class Track < Resource
    @@resource = "tracks"
    JSON.mapping({
      id:           String,
      name:         String,
      popularity:   Int32,
      href:         String,
      track_number: Int32,
    })
  end
end

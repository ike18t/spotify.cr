require "./resource"

module Spotify
  class Playlist < Resource
    @@resource = "playlists"

    def self.find(user_id : String, id : String)
      super id, "users/#{user_id}/playlists"
    end

    JSON.mapping({
      href:   String,
      id:     String,
      images: Array(Image),
      name:   String,
      owner:  PlaylistOwner,
      public: Bool,
      tracks: PlaylistTracks
    })

    def tracks(limit = 100, offset = 0)
      path = ["users", owner.id, "playlists", id, "tracks"].join("/")
      response = Playlist.get("#{path}?limit=#{limit}&offset=#{offset}")
      PlaylistTracks.from_json(response)
    end
  end

  class PlaylistTrack
    JSON.mapping({
      track: Track
    })
  end

  class PlaylistTracks
    JSON.mapping({
      items:    Array(PlaylistTrack),
      limit:    Int32,
      next:     { type: String, nilable: true },
      offset:   Int32,
      previous: { type: String, nilable: true },
      total:    Int32
    })
  end

  class PlaylistOwner
    JSON.mapping({
      external_urls: Hash(String, String),
      href:          String,
      id:            String,
      type:          String,
      uri:           String,
    })
  end
end

module Spotify
  class Track < Resource
    getter :id, :name
    JSON.mapping({
      id:  String,
      name: String
    })
  end
end

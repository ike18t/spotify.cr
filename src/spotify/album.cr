require "./resource"

module Spotify
  class Album < Resource
    @@resource = "albums"
    JSON.mapping({
      id: String,
      name: String,
      popularity: Int32,
      href: String,
      images: Array(Spotify::Image)
    })
  end
end

require "./resource"

module Spotify
  class Artist < Resource
    @@resource = "artists"
    JSON.mapping({
      id: String,
      name: String,
      popularity: Int32,
      href: String,
      images: Array(Spotify::Image)
    })
  end
end

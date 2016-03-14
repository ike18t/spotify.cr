module Spotify
  class Image
    JSON.mapping({
      url:    String,
      height: Int32,
      width:  Int32,
    })
  end
end

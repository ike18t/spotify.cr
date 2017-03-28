module Spotify
  class Image
    JSON.mapping({
      url:    String,
      height: { type: Int32, nilable: true },
      width:  { type: Int32, nilable: true }
    })
  end
end

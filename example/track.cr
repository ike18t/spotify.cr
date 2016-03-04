require "./../src/spotify"

track = Spotify::Track.find("2aoo2jlRnM3A0NyLQqMN2f")
puts track.name

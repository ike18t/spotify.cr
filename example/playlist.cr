require "./../src/spotify"

Spotify::Config.set_credentials(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])

playlist = Spotify::Playlist.find("1295855412", "7Co7hqxAQFSAV7bMtyCGp0")

puts "Name: #{playlist.name}"
puts playlist.tracks.items.last.track.name
puts playlist.tracks.total
puts playlist.tracks.items.size

tracks = playlist.tracks(1, 40)

puts tracks.items.first.track.name
puts tracks.items.size
puts tracks.offset
puts tracks.limit

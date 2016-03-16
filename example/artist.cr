require "./../src/spotify"

artist = Spotify::Artist.find("776Uo845nYHJpNaStv1Ds4")

puts "Name: #{artist.name}"
puts "Genres: #{artist.genres}"
puts "Popularity: #{artist.popularity}"

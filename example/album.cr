require "./../src/spotify"

album = Spotify::Album.find("7rSZXXHHvIhF4yUFdaOCy9")

puts "Name: #{album.name}"
puts "Popularity: #{album.popularity}"
puts "href: #{album.href}"

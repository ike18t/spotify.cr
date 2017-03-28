require "./../src/spotify"

user = Spotify::User.find("1295855412")

puts "Name: #{user.display_name}"
puts "href: #{user.href}"

require "./../src/spotify"

Spotify::Config.set_credentials(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])

user = Spotify::User.find("1295855412")

puts "Name: #{user.display_name}"
puts "href: #{user.href}"

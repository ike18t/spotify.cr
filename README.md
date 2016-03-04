# spotify.cr
> A Crystal wrapper for the Spotify API

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  spotify:
    github: marceloboeira/spotify.cr
```

## Usage

### Track

```crystal
require "spotify"

puts Spotify::Track.find("23MrkN7g6Q5U7GLIxNHN1B").name
# => Foxey Lady
```

## Contributing

1. Fork it (https://github.com/marceloboeira/spotify.cr/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

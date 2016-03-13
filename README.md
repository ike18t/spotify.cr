# spotify.cr [![Build Status](https://travis-ci.org/marceloboeira/spotify.cr.svg?branch=master)](https://travis-ci.org/marceloboeira/spotify.cr)
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

### Album

```crystal
require "spotify"

puts Spotify::Album.find("7rSZXXHHvIhF4yUFdaOCy9").name
# => Are You Experienced
```

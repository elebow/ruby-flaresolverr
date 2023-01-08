# FlareSolverr

Ruby API for the FlareSolverr proxy. See <https://github.com/FlareSolverr/FlareSolverr>.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add flaresolverr

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install flaresolverr

## Usage

```ruby
require "flaresolver"

FlareSolverr.create_image

FlareSolverr.container.start

FlareSolverr.request("https://example.com").body
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/elebow/ruby-flaresolverr.

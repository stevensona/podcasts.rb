# Podcasts

This gem extracts information from an iTunes podcast feed url.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'podcasts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install podcasts

## Usage

```ruby
@feed = Podcasts::Feed.new 'http://podcast.djhardwell.com/podcast.xml'
puts "#{@feed.title} by #{@feed.author} contains #{@feed.items.size} items."
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/podcasts.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

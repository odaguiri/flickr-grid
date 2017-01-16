# Flickr::Grid

Create a collage with 10 photos using Flickr

## Installation

Create your [Flickr](https://www.flickr.com/services/apps) account and generate an app. So you can get your *api_token* and *shared_secret*.

Add this line to your application's Gemfile:

```ruby
gem 'flickr-grid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flickr-grid


## Usage

### Command Line

Optionally you can set the environments so you don't need to set everytime your api secrets

    $ export FLICKR_COLLAGE_API_TOKEN=xxx
    $ export FLICKR_COLLAGE_SHARED_SECRET=xxx
    $ flickr-grid build --api-token=API_TOKEN --shared-secret=SHARED_SECRET --output=/Users/NAME/Documents/collage.jpg --keywords=beef cow sky life water fire wind earth rainbow


### Plain Code

First you need to configure

```ruby
Flickr::Grid.configure do |config|
  config.api_token=API_TOKEN
  config.shared_secret=SHARED_SECRET
end


keywords = %w(wind fire earth water)
output = YOUR_ABSOLUTE_PATH/FILENAME.jpg
Flickr::Grid.collage(keywords, output)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/odaguiri/flickr-grid.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


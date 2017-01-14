$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'flickr/grid'

Flickr::Grid.configure do |config|
  config.api_token= ENV['FLICKR_COLLAGE_API_TOKEN']
  config.shared_secret = ENV['FLICKR_COLLAGE_SHARED_SECRET']
end

require 'minitest/autorun'

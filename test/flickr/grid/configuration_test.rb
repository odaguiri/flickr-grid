require 'test_helper'

class Flickr::Grid::ConfigurationTest < Minitest::Test
  def setup
    @configuration = Flickr::Grid::Configuration.new(
      api_token: 'APITOKEN',
      shared_secret: 'SHAREDSECRET'
    )
  end

  def test_it_has_api_token
    assert_equal 'APITOKEN', @configuration.api_token
  end

  def test_it_has_shared_secret
    assert_equal 'SHAREDSECRET', @configuration.shared_secret
  end
end

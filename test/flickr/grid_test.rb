require 'test_helper'

class Flickr::GridTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Flickr::Grid::VERSION
  end

  def test_that_has_configure_api_token
    Flickr::Grid.configure do |config|
      config.api_token = 'APITOKEN'
    end

    assert_equal 'APITOKEN', Flickr::Grid.configuration.api_token
  end

  def test_that_has_configure_shared_secret
    Flickr::Grid.configure do |config|
      config.shared_secret = 'SHAREDSECRET'
    end

    assert_equal 'SHAREDSECRET', Flickr::Grid.configuration.shared_secret
  end
end

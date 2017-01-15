require 'test_helper'

class Flickr::GridTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Flickr::Grid::VERSION
  end

  def test_that_has_configure_api_token
    Flickr::Grid.configuration.api_token = 'APITOKEN'
    assert_equal 'APITOKEN', Flickr::Grid.configuration.api_token
  end

  def test_that_has_configure_shared_secret
    Flickr::Grid.configuration.shared_secret = 'SHAREDSECRET'
    assert_equal 'SHAREDSECRET', Flickr::Grid.configuration.shared_secret
  end

  def test_that_has_flickr_object
    assert Flickr::Grid.api
  end
end

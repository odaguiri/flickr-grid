require 'test_helper'

class Flickr::GridTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Flickr::Grid::VERSION
  end
end

require 'test_helper'

class Flickr::Grid::QueryTest < Minitest::Test
  def test_that_has_keyword
    keywords = %w(bee fish bear white black coffee ruby train music life)
    query = Flickr::Grid::Query.new(keywords)
    assert_equal keywords, query.instance_variable_get(:@keywords)
  end

  def test_has_limit_10
    assert_equal 10, Flickr::Grid::Query::LIMIT
  end

  def test_should_return_10_photos
    keywords = %w(bee fish bear white black coffee ruby train music life)
    query = Flickr::Grid::Query.new(keywords)
    assert_equal 10, query.search.size
    assert_equal keywords, query.keywords 
  end
end

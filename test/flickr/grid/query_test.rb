require 'test_helper'

class Flickr::Grid::QueryTest < Minitest::Test
  def test_that_has_keyword
    keywords = %w(bee fish bear white black coffee ruby train music life)
    query = Flickr::Grid::Query.new(keywords)
    assert_equal keywords, query.instance_variable_get(:@keywords)
  end

  def test_should_return_10_photos_with_10_keywords
    keywords = %w(bee fish bear white black coffee ruby train music life)
    query = Flickr::Grid::Query.new(keywords)
    query.process do 
      assert_equal 10, query.photos.size

      temp = Dir["#{query.dir}/*"]
      query.photos.each do |photo|
        assert temp.include? photo
      end
    end
  end
end

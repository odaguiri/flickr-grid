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

    filename = "#{absolute_path('collages')}/query-test-collage.jpg"
    query.process(filename) do 
      temp = Dir["#{query.dir}/*"]

      assert_equal 10, query.photos.size
      query.photos.each { |photo| assert temp.include?(photo) }
      assert File.exist?(query.collage.filename)
    end
  end

  private

  def absolute_path(folder)
    File.join(File.expand_path('../../', File.dirname(__FILE__)), 'integrations', folder)
  end
end

require 'test_helper'

class Flickr::Grid::BuilderTest < Minitest::Test
  def setup
    @keywords = %w(bee fish bear white black coffee ruby train music life)
    @temp_photos = Flickr::Grid::Query.new(@keywords).search
    @builder = Flickr::Grid::Builder.new(@temp_photos)
  end

  def test_should_have_temp_photos
    assert_equal 10, @builder.instance_variable_get(:@temp_photos).size
  end

  def test_should_have_collage
    output = "#{integration_path('collages')}/test-should-have-collage.jpg"
    @builder.call(output)
    assert File.exist?(output)
  end

  private

  def integration_path(folder)
    File.join(File.expand_path('../../', File.dirname(__FILE__)), 'integrations', folder)
  end
end

require 'test_helper'

class Flickr::Grid::CollageTest < Minitest::Test
  def setup
    @dir_photos = "#{absolute_path('photos')}/*"
    @dir_collages = absolute_path('collages')
  end

  def test_should_process_images
    filename = "#{@dir_collages}/collage.jpg"
    collage = Flickr::Grid::Collage.new(@dir_photos, filename).process
    assert File.exist?(collage.filename)
  end
 
  private

  def absolute_path(folder)
    File.join(File.expand_path('../../', File.dirname(__FILE__)), 'integrations', folder)
  end
end

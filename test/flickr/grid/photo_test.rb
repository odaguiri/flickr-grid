require 'test_helper'

class Flickr::Grid::PhotoTest < Minitest::Test
  def test_should_have_id
    photo = Flickr::Grid::Photo.new('1', '/tmp/xxx')
    assert_equal '1', photo.instance_variable_get(:@id)
  end

  def test_should_have_dir
    photo = Flickr::Grid::Photo.new(nil, '/tmp/xxx')
    assert_equal '/tmp/xxx', photo.instance_variable_get(:@dir)
  end

  def test_should_have_empty_url
    photo = Flickr::Grid::Photo.new('1', '/tmp/xxx')
    assert_nil photo.instance_variable_get(:@url)
  end

  def test_should_return_nil_if_id_is_invalid
    photo = Flickr::Grid::Photo.new('1', '/tmp/xxx')
    refute photo.send(:url)
  end

  def test_should_return_nil_if_id_is_empty
    photo = Flickr::Grid::Photo.new(nil, '/tmp/xxx')
    assert_nil photo.download
  end

  def test_should_return_photo_url
    photo = Flickr::Grid::Photo.new('32270736356', '/tmp/xxx')
    url = 'https://farm1.staticflickr.com/302/32270736356_329d8c4f13_b.jpg'
    assert_equal url, photo.send(:url)
  end

  def test_should_download_photo
    photo = Flickr::Grid::Photo.new('32270736356', manipulated_photos_path)
    assert_equal [photo.download], Dir["#{manipulated_photos_path}/*"]
  end

  private

  def manipulated_photos_path
    File.join(File.expand_path('../../', File.dirname(__FILE__)), 'integrations', 'manipulated_photos')
  end
end

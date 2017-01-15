require 'test_helper'

class Flickr::Grid::PhotoTest < Minitest::Test
  def test_should_have_id
    photo = Flickr::Grid::Photo.new(id: '1')
    assert_equal '1', photo.instance_variable_get(:@id)
  end

  def test_should_have_dir
    photo = Flickr::Grid::Photo.new(dir: '/tmp/xxx')
    assert_equal '/tmp/xxx', photo.instance_variable_get(:@dir)
  end

  def test_should_have_empty_url
    photo = Flickr::Grid::Photo.new
    assert_nil photo.instance_variable_get(:@url)
  end

  def test_should_return_nil
    photo = Flickr::Grid::Photo.new(id: '1')
    refute photo.send(:url)
  end

  def test_should_return_photo_url
    photo = Flickr::Grid::Photo.new(id: '32270736356')
    url = 'https://farm1.staticflickr.com/302/32270736356_329d8c4f13_b.jpg'
    assert_equal url, photo.send(:url)
  end

  def test_should_download_photo
    Dir.mktmpdir do |dir|
      photo = Flickr::Grid::Photo.new(id: '32270736356', dir: dir)
      assert_equal [photo.download], Dir["#{dir}/*"]
    end
  end
end

require 'test_helper'

class Flickr::Grid::DictionaryTest < Minitest::Test
  def setup
    @file = "#{dictionaries_path}/sample-1"
    @dictionary = Flickr::Grid::Dictionary.new(@file)
  end

  def test_should_return_default_dir
    dictionary = Flickr::Grid::Dictionary.new
    assert_equal '/usr/share/dict/words', dictionary.instance_variable_get(:@file)
  end

  def test_should_change_default_file
    assert_equal @file, @dictionary.instance_variable_get(:@file)
  end

  def test_should_return_filesize
    assert_equal 4, @dictionary.send(:filesize)
  end

  def test_should_get_random_word
    assert %w(water fire wind earth).include? @dictionary.random_word
  end

  private

  def dictionaries_path
    File.join(File.expand_path('../../', File.dirname(__FILE__)), 'integrations', 'dictionaries')
  end
end

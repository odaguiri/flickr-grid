require 'open-uri'
require 'rmagick'
require 'rmagick/screwdrivers'
require 'flickraw'
require 'flickr/grid/version'
require 'flickr/grid/configuration'
require 'flickr/grid/builder'
require 'flickr/grid/photo'
require 'flickr/grid/collage'
require 'flickr/grid/query'
require 'flickr/grid/dictionary'

module Flickr
  module Grid
    include Magick
  end
end

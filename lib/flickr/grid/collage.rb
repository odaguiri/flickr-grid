module Flickr
  module Grid
    class Collage
      def initialize(dir, output)
        @dir = dir
        @output = output
        @options = {
          columns: 5,
          scale_range: 0.1,
          thumb_width: 200,
          rotate_angle: 20,
          background: 'white',
          border: '#FFF'
        }
      end

      def process
        Magick::Screwdrivers.collage(@dir, @options).write(@output)
      end
    end
  end
end

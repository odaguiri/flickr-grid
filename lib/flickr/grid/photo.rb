module Flickr
  module Grid
    class Photo
      WIDTH = 1000
      HEIGHT = 480

      def initialize(photo, dir)
        @photo = photo 
        @dir = dir
        @url = nil
        @tempfile = nil
        @image = nil
      end

      def download
        return nil if @photo.nil? || url.nil?
        file = open(url)
        image = Flickr::Grid::Image.from_blob(file.read).first
        image.resize_to_fill!(WIDTH, HEIGHT)
        image.write('jpeg:' + tempfile)
        image.filename
      end

      private

      def url
        @url ||= FlickRaw.url_b(@photo)
      rescue
        nil
      end

      def filename
        File.basename(url)
      end

      def tempfile
        @tempfile ||= File.join(@dir, filename)
      end
    end
  end
end

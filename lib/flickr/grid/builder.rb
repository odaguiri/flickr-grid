module Flickr
  module Grid
    class Builder
      def initialize(temp_photos)
        @temp_photos = temp_photos
        @photos = []
        @collage = nil
      end

      def call(output)
        Dir.mktmpdir do |dir|
          @dir = dir

          download_photos
          create_collage(output)
        end

        @collage
      end

      private

      def download_photos
        @temp_photos.each do |temp|
          @photos << Flickr::Grid::Photo.new(temp, @dir).download
        end
      end

      def create_collage(output)
        @collage = Flickr::Grid::Collage.new(@dir, output).process
      end
    end
  end
end

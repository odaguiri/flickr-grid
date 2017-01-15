module Flickr
  module Grid
    class Photo
      def initialize(id, dir)
        @id = id
        @dir = dir
        @url = nil
        @tempfile = nil
      end

      def download
        return nil if @id.nil? || url.nil?
        file = open(url)
        File.open(tempfile, 'wb') do |f|
          f.write(file.read)
        end
        tempfile
      end

      private

      def url
        @url ||= FlickRaw.url_b(
          Flickr::Grid.api.photos.getInfo(photo_id: @id)
        )
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

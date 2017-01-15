module Flickr
  module Grid
    class Query
      attr_reader :collage, :photos, :dir

      def initialize(keywords)
        @keywords = keywords
        @photos = []
        @collage = nil
        @dir = nil
        @options = { per_page: 1, page: 1,
                     sort: 'interestingness-desc',
                     content_type: 1, media: :photos }
      end

      def process(output)
        Dir.mktmpdir do |dir|
          @dir = dir
          process_photos
          process_collage(output)
          yield
        end
      end

      private

      def search(keyword)
        Flickr::Grid.api.photos.search(
          @options.merge(text: keyword)
        )[0]
      end

      def process_photos
        @photos = @keywords.map do |keyword|
          id = search(keyword)['id']
          Flickr::Grid::Photo.new(id, @dir).download
        end
      end

      def process_collage(output)
        @collage = Flickr::Grid::Collage.new(@dir, output).process
      end
    end
  end
end

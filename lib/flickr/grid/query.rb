module Flickr
  module Grid
    class Query
      attr_reader :photos, :dir

      def initialize(keywords)
        @keywords = keywords
        @photos = []
        @dir = nil
        @options = {
          per_page: 1,
          page: 1,
          sort: 'interestingness-desc',
          content_type: 1,
          media: :photos
        }
      end

      def process
        Dir.mktmpdir do |dir|
          @dir = dir
          @photos = @keywords.map do |keyword|
            id = search(keyword)['id']
            Flickr::Grid::Photo.new(id, dir).download
          end

          yield
        end
      end

      private

      def search(keyword)
        Flickr::Grid.api.photos.search(
          @options.merge(text: keyword)
        )[0]
      end
    end
  end
end

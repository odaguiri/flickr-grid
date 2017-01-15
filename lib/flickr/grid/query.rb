module Flickr
  module Grid
    class Query
      LIMIT = 10

      attr_reader :keywords, :photos

      def initialize(keywords)
        @keywords = keywords
        @photos = []
        @options = {
          per_page: 1,
          page: 1,
          sort: 'interestingness-desc',
          content_type: 1,
          media: :photos
        }
      end

      def search
        process(@keywords)
        @photos
      end

      private

      def process(keywords)
        keywords.each do |keyword|
          @photos << Flickr::Grid.api.photos.search(
            @options.merge(text: keyword)
          )[0]
        end
      end
    end
  end
end

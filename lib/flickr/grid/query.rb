module Flickr
  module Grid
    class Query
      LIMIT = 10

      attr_reader :keywords, :photos

      def initialize(keywords)
        @dictionary = Flickr::Grid::Dictionary.new
        @keywords = keywords || []
        @photos = []
        @options = {
          per_page: 1,
          page: 1,
          sort: 'interestingness',
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
          search = Flickr::Grid.api.photos.search(@options.merge(text: keyword))[0]
          if search
            @photos << Flickr::Grid.api.photos.getInfo(photo_id: search['id'])
          end
        end
        @photos.compact!

        process(new_keywords) if @photos.size < LIMIT
      end

      def new_keywords
        keywords = (1..(LIMIT - @photos.size)).map do |_i|
          @dictionary.random_word
        end
        @keywords.concat(keywords)
        keywords
      end
    end
  end
end

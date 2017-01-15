module Flickr
  module Grid
    class Dictionary
      DEFAULT_FILE = '/usr/share/dict/words'.freeze

      def initialize(file = nil)
        @file = file || DEFAULT_FILE
        @filesize = nil
      end

      def random_word
        number = Random.new.rand(1..filesize).to_i
        File.open(@file) do |file|
          (number - 1).times { file.gets }
          next file.gets.chomp
        end
      end

      private

      def filesize
        @filesize ||= File.foreach(@file).count
      end
    end
  end
end

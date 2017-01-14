module Flickr
  module Grid
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration)

      FlickRaw.api_key = configuration.api_token
      FlickRaw.shared_secret = configuration.shared_secret
    end

    class Configuration
      attr_accessor :api_token, :shared_secret

      def initialize(options = {})
        @api_token = options[:api_token]
        @shared_secret = options[:shared_secret]
      end
    end
  end
end

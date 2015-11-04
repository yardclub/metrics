require 'metrics/client'

  module Metrics
    class << self
      attr_accessor :server_name, :api_key, :hostname

      def server_name
        if @server_name.nil?
          raise ArgumentError, "You must specify a server name."
        end
        @server_name
      end

      def hostname
        if @hostname.nil?
          return Client::STATSD_DEFAULT_HOSTNAME
        end
        @hostname
      end
    end

    module Mixin
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def metrics
          @metrics ||= Client.metrics
        end
      end

      def metrics
        self.class.metrics
      end
    end

  end

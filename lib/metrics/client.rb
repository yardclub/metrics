require 'statsd'

module Metrics
  class Client < ::Statsd
    STATSD_DEFAULT_HOSTNAME = "127.0.0.1"
    STATSD_DEFAULT_PORT = 8125

    attr_reader :hostname, :port

    def initialize(hostname, port, api_key="")
      @hostname = hostname
      @port = port

      super(@hostname, @port)
      self.namespace = api_key unless api_key.empty?
    end

    public
    class << self
      def metrics
        new(Metrics.hostname, Client::STATSD_DEFAULT_PORT, Metrics.api_key.to_s)
      end
    end
  end
end

require 'spec_helper'

describe 'Client' do
  it 'should initialize a new statsd client when calling metrics' do
    met = Metrics::Client.metrics
    expect(met).to be_a(Metrics::Client)
    expect(met.hostname).to eq('127.0.0.1')
    expect(met.port).to eq(8125)
  end

  it 'should create with the specified hostname and port' do
    met = Metrics::Client.new('fake_host', 2300)
    expect(met.hostname).to eq('fake_host')
    expect(met.port).to eq(2300)
  end

  it 'should allow for an api key to be added as a namespace/prefix for future requests' do
    met = Metrics::Client.new("hosted_graphite.psh", 666, "super_salty")
    expect(met.prefix).to eq("super_salty.")
  end
end


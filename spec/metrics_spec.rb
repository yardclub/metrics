require 'spec_helper'

describe 'Metrics' do
  it 'has a version number' do
    expect(Metrics::VERSION).not_to be nil
  end

  it 'should require a server_name to be specified' do
    expect { Metrics.server_name }.to raise_error
    Metrics.server_name = "heroku_staging"
    expect(Metrics.server_name).to eq("heroku_staging")
  end

  it 'should use the default hostname if none is specified' do
    expect(Metrics.hostname).to eq('127.0.0.1')
    Metrics.hostname = 'super_secret_server'
    expect(Metrics.hostname).to eq('super_secret_server')
  end
end


# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metrics/version'

Gem::Specification.new do |spec|
  spec.name          = "metrics"
  spec.version       = Metrics::VERSION
  spec.authors       = ["Dan Bradbury"]
  spec.email         = ["dan@yardclub.com"]

  spec.summary       = %q{Simple yardclub specific wrapper for statsd reporting}
  spec.description   = %q{Other wrappers suck this one is good}
  spec.homepage      = "http://yardclub.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = ['lib/metrics.rb', 'lib/metrics/client.rb', 'lib/metrics/version.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "statsd-ruby", "~> 1.2.1"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end

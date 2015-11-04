# Metrics
Measure all things in your apps

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'metrics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install metrics

## Setup

Add the following to your application

```
require 'metrics'

Metrics.hostname = "my_hostname" #required
Metrics.api_key  = "my_api_key" #optional
```

## Usage
Add the `Mixin` module to any class you'd like to add metrics to:

```
class Foo
  include Metrics:: Mixin
  ....
  metrics.increment("my_counter")
end

```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


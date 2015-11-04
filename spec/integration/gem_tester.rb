require 'metrics'

#specify hostname for testing
Metrics.hostname = "127.0.0.1"

class GemTester
  include Metrics::Mixin

  def statsd_metrics
    metrics.increment("inc_count_test")
    metrics.decrement("inc_count_test")
    metrics.count("inc_count_test", 4)
    metrics.timer("inc_timer_test", 100)
  end

  def test_count
    3.times do |f|
      metrics.count("inc_counter_test", f)
      print '.'; sleep 30
    end
  end

  def test_counter
    10.times do |f|
      metrics.increment("inc_counter_test")
      print '.'
    end
    10.times do |f|
      metrics.increment("inc_counter_test")
      print '.'; sleep 2;
    end
  end
end
g = GemTester.new
g.test_counter

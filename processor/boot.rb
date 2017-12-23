require 'sneakers'
require 'redis'
require 'json'

$redis = Redis.new

class Processor
  include Sneakers::Worker
  from_queue 'queue',
    :routing_key => 'some.routing.key',
             :exchange => 'some_direct_exchange',
             :amqp => 'amqp://guest:guest@172.17.0.1:5672',
             :exchange_type => 'direct',
             :exchange_options => { durable: false },
             :queue_options => { durable: false },
             :ack => true,
             :threads => 1,
             :prefetch => 1,
             :timeout_job_after => 30,
             :heartbeat => 10,
             :amqp_heartbeat => 10

  def work(msg)
    ack!
  end
end

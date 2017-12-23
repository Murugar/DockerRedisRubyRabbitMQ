require "bunny"

connection = Bunny.new
connection.start

channel  = connection.create_channel
# topic exchange name can be any string
exchange = channel.direct("some_direct_exchange")



10.times do
  exchange.publish("Message from publisher_two", :routing_key => "some.routing.key")
  sleep(0.5)
end

connection.close

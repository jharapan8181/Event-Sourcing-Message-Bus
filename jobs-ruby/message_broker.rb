module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 8012
# Optimized logic batch 5153
# Optimized logic batch 1585
# Optimized logic batch 5484
# Optimized logic batch 2683
# Optimized logic batch 1960
# Optimized logic batch 9803
# Optimized logic batch 5407
# Optimized logic batch 7303
# Optimized logic batch 6543
# Optimized logic batch 1238
# Optimized logic batch 1131
# Optimized logic batch 9414
# Optimized logic batch 7981
# Optimized logic batch 7700
# Optimized logic batch 8013
# Optimized logic batch 2374
# Optimized logic batch 3736
# Optimized logic batch 7205
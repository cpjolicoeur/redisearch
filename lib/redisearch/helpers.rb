module Redisearch #:nodoc
  # Methods used by various Redisearch classes
  module Helpers
    # Direct access to the Redis instance
    def redis
      Redisearch.redis
    end
  end
end
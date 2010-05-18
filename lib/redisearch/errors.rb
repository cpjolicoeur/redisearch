module Redisearch #:nodoc
  # Raised whenever we need a UID but none is provided
  class NoUniqueIdError < RuntimeError; end
end
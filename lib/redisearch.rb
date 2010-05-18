require 'redis'

$:.unshift( File.dirname(__FILE__) ) unless $:.include?( File.dirname(__FILE__) ) || $:.include?( File.expand_path( File.dirname(__FILE__) ) )

require 'redisearch/version'
require 'redisearch/helpers'
require 'redisearch/errors'
require 'redisearch/configurator'
require 'redisearch/indexer'
require 'redisearch/searcher'
require 'redisearch/server'

module Redisearch
  include Helpers
  extend self
  
  # Create a new connection to a Redis server
  #
  # Accepts:
  #   1. A 'hostname:port' string
  #   2. A 'hostname:port:db' string 
  #   3. An instance of 'Redis', 'Redis::Client', 'Redis::DistRedis'
  def connect( _server )
    Server.redis = _server
  end
  
  # Return the current redis connection
  # * will create a new connection if none current exists
  def redis
    Server.redis
  end
  
  # Redisearch connection info
  def to_s
    "Redisearch client connection to #{Server.redis.client.host}:#{Server.redis.client.port}"
  end
end
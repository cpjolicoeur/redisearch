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
  
  # Accepts:
  #   1. A 'hostname:port' string
  #   2. A 'hostname:port:db' string 
  #   3. An instance of 'Redis', 'Redis::Client', 'Redis::DistRedis'
  def redis=(server)
    case server
    when String
      host, port, db = server.split(':')
      @redis = Redis.new(
        :host => host,
        :port => port,
        :db => db,
        :thread_safe => true
      )
    when Redis, Redis::Client, Redis::DistRedis
      @redis = server
    else
      raise "Can't connect to redis server at: #{server.inspect}"
    end
  end
  
  # Return the current redis connection
  # * will create a new connection if none current exists
  def redis
    return @redis if @redis
    self.redis = 'localhost:6379' # default redis connection
    self.redis
  end
  
  # Redisearch connection info
  def to_s
    "Redisearch client connection to #{redis.server}"
  end
end
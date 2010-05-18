require 'redis'

require 'redisearch/version'
require 'redisearch/errors'
require 'redisearch/helpers'

module Redisearch
  include Helpers
  # extend self
  
  # Accepts:
  #   1. A 'hostname:port' string
  #   2. A 'hostname:port:db' string 
  #   3. An instance of 'Redis', 'Redis::Client', 'Redis::DistRedis', 'Redis::Namespace'
  def redis=(server)
    case server
    when String
      host, port, db = server.split(':')
      redis = Redis.new(
        :host => host,
        :port => port,
        :db => db,
        :thread_safe => true
      )
      @redis = Redis::Namespace.new( :redisearch, :redis => redis )
    when Redis, Redis::Client, Redis::DistRedis
      @redis = Redis::Namespace.new( :redisearch, :redis => server )
    when Redis::Namespace
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
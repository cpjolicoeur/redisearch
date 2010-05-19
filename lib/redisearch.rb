require 'redis'
require 'english/metaphone'

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
  
  # Update Redisearch configuration options
  # Accepts a hash of new setting values
  def configure( _new_settings )
    Configurator.update_settings( _new_settings )
  end
  
  # Return the current Redisearch configuration settings
  def settings
    Configurator.settings
  end
  
  # Index new words for search
  def index( _text, _uid )
    # TODO
  end
  
  # Search for a word
  def search( _word )
    # TODO
  end
  
  # Remove a UID from indexes
  def remove( _uid )
    # TODO
  end
  
  # Reindex and existing UID with new text
  def reindex( _uid, _text )
    # TODO
  end
  
  # Redisearch connection info
  def to_s
    "Redisearch client connection to #{Server.redis.client.host}:#{Server.redis.client.port}"
  end
end

require 'helper'

context "Redisearch::Server" do
  setup do
    Redisearch.redis.flushall
  end
  
  test "default test" do
    assert true
  end

  # should "setup a default server if none exists" do
  #   assert Redisearch::Server.redis
  #   assert_kind_of Redis, Redisearch::Server.redis
  #   assert_equal 'localhost', Redisearch::Server.redis.client.host
  #   assert_equal 9736, Redisearch::Server.redis.client.port
  # end

  # should "setup a server connection with hostname:port" do
  #   assert true
  # end
  
  # should "setup a server connection with hostname:port:db"

  # should "setup a server connect with a Redis instance"
  # 
  # should "setup a server connect with a Redis::Client instance"

  # should "setup a server connect with a Redis::DistRedis instance"
end

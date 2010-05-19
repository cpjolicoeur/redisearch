require 'helper'

context "Redisearch" do
  setup do
    Redisearch.redis.flushall
  end

  test "default test" do
    assert true
  end
  
  # test "can update configuration settings" do
  #   assert false, "DUMMY TEST"
  # end
  # 
  # test "can connect to Redis server" do 
  #   pending
  # end
end

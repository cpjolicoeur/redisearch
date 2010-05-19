require 'helper'

context "Redisearch" do

  setup do
    Redisearch.redis.flushall
  end

  test "connection debug string" do
    assert_match /localhost:9736/, Redisearch.to_s
  end
  
  test "can update configuration settings" do
    assert_equal 3, Redisearch.settings[:min_word_length]
    Redisearch.configure( :min_word_length => 8 )
    assert_equal 8, Redisearch.settings[:min_word_length]
    Redisearch.configure( :min_word_length => 4 )
    assert_equal 4, Redisearch.settings[:min_word_length]

    Redisearch.configure( :stop_words => 'stop_word' )
    assert_equal ['stop_word'], Redisearch.settings[:stop_words]
    Redisearch.configure( :stop_words => ['stop', 'word'] )
    assert_equal ['stop', 'word'], Redisearch.settings[:stop_words]

    Redisearch.configure( :punctuation_chars => 'abc' )
    assert_equal 'abc', Redisearch.settings[:punctuation_chars]
  end

  #
  # FIXME: figure out how to properly test the Server connection
  # since we set the connection in `test/helper.rb`
  #
  # test "can connect to Redis server" do 
  #   assert Redisearch.redis
  #   assert_equal 'localhost', Redisearch.redis.client.host
  #   assert_equal 9736, Redisearch.redis.client.port
  # end

  # test "can connect to a Redis server with db param" do
  #   Redisearch.connect( 'localhost:9736:foo_db' )
  #   assert_equal 'foo_db', Redisearch.redis.client.db
  # end

end

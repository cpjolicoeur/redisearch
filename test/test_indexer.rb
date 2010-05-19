require 'helper'

context "Redisearch::Indexer" do
  setup do
    Redisearch.redis.flushall
    Redisearch::Configurator.reset_to_defaults!

    @text = "Here is sample text"
    @words_from_text = ["Here", "sample", "text"]
  end

  context "#get_words_from_text" do
    should "return an empty array if no text given" do
      assert_equal [], Redisearch::Indexer.send( :get_words_from_text, nil )
      assert_equal [], Redisearch::Indexer.send( :get_words_from_text, '' )
      assert_equal [], Redisearch::Indexer.send( :get_words_from_text, "  \n\n\t  \n " )
    end

    should "return an array of words from text" do
      assert_equal @words_from_text, Redisearch::Indexer.send( :get_words_from_text, @text )
    end

    should "not index words shorter than min_length" do
      text = "abcdef ab b bc bcd foobar"
      words = ["abcdef", "bcd", "foobar"]
      assert_equal words, Redisearch::Indexer.send( :get_words_from_text, text )
    end 

    should "not index stop words" do
      text = "Text and with an a stop the words"
      words = ["Text", "with", "stop", "words"]
      assert_equal words, Redisearch::Indexer.send( :get_words_from_text, text )
      assert_equal [], Redisearch::Indexer.send( :get_words_from_text, "the\nand" )
    end

    should "properly handle punctuation characters" do
      text = "Text, with some; punctuation (characters like) this\nand some more"
      words = ["Text", "with", "some", "punctuation", "characters", "like", "this", "some", "more"]
      assert_equal words, Redisearch::Indexer.send( :get_words_from_text, text )
    end
  end

end

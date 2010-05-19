require 'helper'

context "Redisearch::Configurator" do
  setup do
    Redisearch.redis.flushall
    Redisearch::Configurator.reset_to_defaults!
  end

  should "establish default settings" do
    assert_equal 3, Redisearch::Configurator.settings[:min_word_length]
    assert Redisearch::Configurator.settings[:stop_words].include?( 'the' )
    assert Redisearch::Configurator.settings[:stop_words].include?( 'and' )
    assert Redisearch::Configurator.settings[:stop_words].include?( 'that' )
    assert_equal %Q#.,;:!?@$%^&*\\(\\)\\[\\]\\{\\}\\\\"\'\|`~\\/#, Redisearch::Configurator.settings[:punctuation_chars]
  end

  should "allow default settings to be overridden" do
    Redisearch::Configurator.update_settings(
      :min_word_length => 5,
      :stop_words => ['foo', 'bar']
    )
    assert_equal 5, Redisearch::Configurator.settings[:min_word_length]
    assert_equal ['foo', 'bar'], Redisearch::Configurator.settings[:stop_words]
  end

  should "allow user to reset settings to default" do
    Redisearch::Configurator.update_settings(
      :min_word_length => 5
    )
    assert_equal 5, Redisearch::Configurator.settings[:min_word_length]
    Redisearch::Configurator.reset_to_defaults!
    assert_equal 3, Redisearch::Configurator.settings[:min_word_length]
  end

  should "allow stop words to be an Array or String" do
    Redisearch::Configurator.update_settings( :stop_words => "foobar" )
    assert_equal ['foobar'], Redisearch::Configurator.settings[:stop_words]
    Redisearch::Configurator.update_settings( :stop_words => ['foo', 'bar', 'baz'] )
    assert_equal ['foo', 'bar', 'baz'], Redisearch::Configurator.settings[:stop_words]
  end

  should "compile the punctuation regexp on settings update" do
    assert_kind_of Regexp, Redisearch::Configurator.settings[:punctuation_regexp]
    Redisearch::Configurator.update_settings( :punctuation_chars => 'abc' )
    assert_equal /abc/, Redisearch::Configurator.settings[:punctuation_regexp]
  end

end

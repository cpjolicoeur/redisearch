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
    assert_equal ".,;:!?@$%^&*()--<>[]{}\\|/`~'\"", Redisearch::Configurator.settings[:punctuation_chars]
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

end

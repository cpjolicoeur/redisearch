module Redisearch #:nodoc
  # Configuration methods for Redisearch
  module Configurator
    include Helpers
    extend self
    
    # Do not index words shorter than this length
    MIN_WORD_LENGTH   = 3
    # Words which should not be indexed
    STOP_WORDS        = ['the', 'of', 'to', 'and', 'a', 'in', 'is', 'it', 'you', 'that']
    # Convert punctuation to spaces before indexing
    PUNCTUATION_CHARS = ".,;:!?@$%^&*()--<>[]{}\\|/`~'\""
    
    # update the default configuration
    # Accepts:
    #   1) :min_word_length (Integer)
    #   2) :stop_words (Array)
    #   3) :punctuation_chars (String)
    def update_settings( _options={} )
      @settings = settings.merge( _options )
    end
    
    # return the current configuration settins
    def settings
      return @settings if @settings
      @settings = {
        :min_word_length => MIN_WORD_LENGTH,
        :stop_words => STOP_WORDS,
        :punctuation_chars => PUNCTUATION_CHARS
      }
    end

    private
    
    # Set Redisearch settings hash 
    # * will overwrite any existing settings
    def settings=( _new_settings={} )
      @settings = _new_settings
    end
       
  end
end
module Redisearch #:nodoc
  # Redisearch indexing methods
  module Indexer
    include Helpers
    extend self

    # Index words from text for a given UID
    def index_text( _text, _uid )

    end

    private

    # Return an array of words to index
    def get_words_from_text( _text )
      return [] if _text.nil? or _text.empty?
      text = _text.gsub( Configurator.settings[:punctuation_regexp], ' ')
      return text.split.delete_if { |word| word.size < Configurator.settings[:min_word_length] || Configurator.settings[:stop_words].include?( word.downcase ) }
    end

    # Return an array of metaphones from an array of words
    def get_metaphones_from_words( _words )

    end
  end
end

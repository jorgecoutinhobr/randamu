module Randamu
  class Text < Base
    class << self
      WORD_TYPES = %w(upcase downcase capitalize)
      # Implement safe guard for methods "if size < 1 then return something"
      def word(format: nil)
        case format
        when :upcase
          load_db.sample.upcase
        when :downcase
          load_db.sample.downcase
        when :capitalize
          load_db.sample.capitalize
        else
          load_db.sample
        end
      end

      def title(words: 3)
        words.times.map { word }.join(' ').capitalize
      end

      def phrase(words: 4)
        words.times.map { word }.join(' ').capitalize + '.'
      end

      def paragraph(phrases: 8)
        phrases.times.map { phrase }.join(' ')
      end

      def big_text(paragraphs: 4)
        paragraphs.times.map { paragraph }.join("\n\n")
      end

      alias :frase :phrase

      private
        def load_db
          load_data('texts.lorem')
        end
    end
  end
end

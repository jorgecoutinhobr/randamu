module Randamu
  class Text < Base
    class << self
      WORD_TYPES = %w(upcase downcase capitalize)

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

      def text(paragraphs: 4)
        paragraphs.times.map { paragraph }.join("\n\n")
      end

      alias :palavra :word
      alias :titulo :title
      alias :frase :phrase
      alias :paragrafo :paragraph
      alias :texto :text
      private
        def load_db
          load_data('texts.lorem')
        end
    end
  end
end

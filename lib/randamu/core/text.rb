module Randamu
  class Text < Base
    class << self
      def word(format: nil)
        case format
        when :upcase
          load_data('texts.lorem').sample.upcase
        when :downcase
          load_data('texts.lorem').sample.downcase
        when :capitalize
          load_data('texts.lorem').sample.capitalize
        else
          load_data('texts.lorem').sample
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
    end
  end
end

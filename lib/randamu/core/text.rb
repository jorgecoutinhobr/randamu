module Randamu
  class Text < Base
    FORMATS = %i(upcase downcase capitalize)

    class << self
      def word(format: nil)
        word = load_data('texts.lorem').sample

        return word.send(format) if format && FORMATS.include?(format.to_sym)
        word
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

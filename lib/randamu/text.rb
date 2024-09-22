module Randamu
  class Text < Base
    class << self
      def word
        load_data('text.lorem').sample
      end

      def sentence(word_count = 4)
        word_count.times.map { word }.join(' ').capitalize
      end

      def paragraph(sentence_count = 8)
        sentence_count.times.map { sentence }.join('. ') + '.'
      end

      def big_text(paragraph_count = 4)
        paragraph_count.times.map { paragraph }.join("\n\n")
      end
    end
  end
end
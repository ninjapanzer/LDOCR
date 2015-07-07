class DocumentProcessor
  SENTENCE = /[^.!?\s][^.!?]*(?:[.!?](?!['"]?\s|$)[^.!?]*)*[.!?]?['"]?(?=\s|$)/
  CANNONICALIZE = ->(string) { string.gsub(/[,"':;\.\/\\]/,"").downcase.squeeze(" ") }

  def initialize(file)
    document = Document.create filename: file
    IO.foreach(file) do |line|
      sentences = line.scan(SENTENCE).map &CANNONICALIZE
      sentences.each do |s|
        sentence = Sentence.create document_id: document.id
        words = s.split(' ')
        words.each_with_index do |w,i|
          find_word = Word.where(word: w).first
          word_id = find_word.id unless find_word.nil?
          attrs = {
            word_id: word_id,
            sentence_position: i,
            sentence_id: sentence.id,
            document_id: document.id,
            document_position: nil
          }
          Element.create attrs
        end
      end
    end
  end
end

class DocumentModel
  attr_accessor :title, :blocks, :keywords
  def initialize(title)
    @title = title
    @blocks = Array.new
    @keywords = Array.new
  end
end

class BlockModel
  attr_accessor :element, :type, :blocks, :keywords
  def initialize(element)
    @element = element
    @blocks = []
    @keywords = []
    @type = []
  end
end

class WordModel
  attr_accessor :word, :type, :dict
  def initialize(word)
    @word = word

  end
end

class DocumentProcessor
  def initialize(file)
    IO.foreach('DataFiles/dictionary_source/'+f) do |line|
      document = DocumentModel.new(f)
      document.element = line
      
    end
  end
  def self.IdentifyWords()
  end
  def self.Canonicalization(string) # REMOVES Special Characters and Sets the string to lower case
    return string.gsub(%r[\,\"\/\\'],"").downcase
  end
  def self.OrganizeDocument()
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
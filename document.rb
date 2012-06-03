File  = 'DataFiles/1974.txt'

class DocumentProcessor
  def initialize(file)
    document = DocumentModel.new("document")
    IO.foreach(file) do |line|
      line = Canonicalization(line);
      puts line
    end
  end
  def IdentifyWords()
  end
  def Canonicalization(string) # REMOVES Special Characters and Sets the string to lower case
    return string.gsub(/[,"':;\/\\]/,"").downcase.squeeze(" ")
    
  end
  def OrganizeDocument()
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
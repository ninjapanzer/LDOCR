class WordListProcessor
  def self.LoadDictionary()
    wordCollection = Array.new
    Dir.foreach('DataFiles/dictionary_source/') do |f|
      if f.match('index')
        puts f
        IO.foreach('DataFiles/dictionary_source/'+f) do |line|
          if(line[0] + line[1] != '  ')
            wordCollection.push(WordListObject.new(line))
          end
        end
      end
    end
    return wordCollection
  end
end

class WordListObject
  attr_accessor :word, :type, :definition
  def initialize(word, type, definition)
    @word = word
    @type = type
    @definition = definition
  end
  def initialize(dictString)
    row = dictString.split
    @word = row[0]
    @type = row[1]
    @definition = row[8]
  end
end

something = WordListProcessor.LoadDictionary
class WordListProcessor
  def self.LoadDictionary()
    dictHash = Hash.new
    Dir.foreach('DataFiles/dictionary_source/') do |f|
      if f.match('index')
        puts f
        wordCollection = Hash.new
        IO.foreach('DataFiles/dictionary_source/'+f) do |line|
          if(line[0] + line[1] != '  ')
            wordObj = WordListObject.new(line)
            wordCollection[wordObj.word] = wordObj
          end
        end
        dictHash[f] = wordCollection
      end
    end
    return dictHash
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
    @definition = row.last
  end
end
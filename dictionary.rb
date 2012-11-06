require_relative 'models'

class WordListProcessor
  def self.LoadDictionary()
    dictHash = Hash.new
    Dir.foreach('Datafiles/dictionary_source/') do |f|
      if f.match('index')
        puts f
        wordCollection = Hash.new
        IO.foreach('Datafiles/dictionary_source/'+f) do |line|
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

  def self.Store_Dictionary()
    Dir.foreach('Datafiles/dictionary_source/') do |f|
      if f.match('index')
        puts f
        IO.foreach('Datafiles/dictionary_source/'+f) do |line|
          if(line[0] + line[1] != '  ')
              wordObj = WordListObject.new(line)
              word = Word.create
              word.type = Type.find_by_name wordObj.type
              word.word = wordObj.word
              word.save
            end
        end
      end
    end
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
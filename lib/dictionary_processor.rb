require_relative './models'

class DictionaryProcessor
  attr_reader :datafiles

  def initialize(config = {})
    @datafiles = config.fetch(:datafiles, 'Datafiles/dictionary_source/')
  end

  def load_dictionary
    dict = {}
    index_files = Dir.foreach(datafiles).select { |f| f.match('index') }
    index_files.each { |f| load_dictionary_index(f) }
  end

  def load_dictionary_index(file)
    file_source = "#{datafiles}#{file}"
    IO.foreach(file_source) do |line|
      if(line[0] + line[1] != '  ')
        Word.create(extract(line))
      end
    end
  end

  def extract(dictString)
    row = dictString.split
    {
      word: row[0],
      part_of_speech: row[1],
      definition: row.last
    }
  end
end

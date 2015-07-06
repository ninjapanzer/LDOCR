require './app'

desc "Run migrations"
task :migrate do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end

desc "Load Dictionary"
task :load_dictionary do
  require './dictionary_processor'
  DictionaryProcessor.new.load_dictionary
end
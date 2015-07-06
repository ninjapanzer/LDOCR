require './app'

task default: [:spec]

desc "Run migrations"
task :migrate do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end

desc "Load Dictionary"
task :load_dictionary do
  require './lib/dictionary_processor'
  DictionaryProcessor.new.load_dictionary
end

desc "test"
task :spec do
  sh 'rspec spec'
end
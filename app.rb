require 'active_record'
require 'sqlite3'
require 'logger'
require_relative 'lib/models'

ActiveRecord::Base.logger = Logger.new('debug.log')
configuration = YAML::load(IO.read('config/database.yaml'))
ActiveRecord::Base.establish_connection(configuration['development'])

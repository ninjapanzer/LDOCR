require_relative 'config/active_record_config'
require_relative 'models'

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "db/LDOCR.sqlite3"
)

require_relative 'config/active_record_config'
require_relative 'models/type'
require_relative 'models/word'

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "db/LDOCR.sqlite3"
)


def setup_models()
	$w = Word.new
	$t = Type.new
end

setup_models
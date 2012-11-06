require_relative '../config/active_record_config'
require_relative '../models/word'
require_relative '../models/type'

w = Word.new
t = Type.new
w.type = t

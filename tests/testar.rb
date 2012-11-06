require_relative '../config/active_record_config'
require_relative '../models/word'
require_relative '../models/type'

w = Word.new
t = Type.new

Word.transaction do
  t.words.push w
  t.save!
  puts t.words
  puts w.type == t
  puts w.id
  raise ActiveRecord::Rollback
end

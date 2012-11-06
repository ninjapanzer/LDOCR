load '../config/active_record_config.rb'

ActiveRecord::Schema.define do
  create_table :types do |t|
    t.text :name
  end

  create_table :words do |t|
    t.text :word
    t.references :type
    t.timestamps
  end
end